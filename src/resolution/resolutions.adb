with affichage; use affichage;
package body resolutions is

   -----------------------
   -- estChiffreValable --
   -----------------------

   function estChiffreValable
     (g : in Type_Grille;
      v :    Integer;
      c :    Type_Coordonnee) return Boolean
   is
   begin
      if not caseVide(g, c) then
         raise CASE_NON_VIDE;
      end if;

      return not appartientChiffre(obtenirChiffresDUneLigne(g, obtenirLigne(c)), v) and
             not appartientChiffre(obtenirChiffresDUneColonne(g, obtenirColonne(c)), v) and
             not appartientChiffre(obtenirChiffresDUnCarre(g, obtenirCarre(c)), v);
   end estChiffreValable;

   -------------------------------
   -- obtenirSolutionsPossibles --
   -------------------------------

   function obtenirSolutionsPossibles
     (g : in Type_Grille; c : in Type_Coordonnee) return Type_Ensemble
   is
      possible : Type_Ensemble;
   begin
      possible:= construireEnsemble;
      if not caseVide(g, c) then
         raise CASE_NON_VIDE;
      end if;
      for i in 1 .. 9 loop
         if not appartientChiffre(obtenirChiffresDUneLigne(g, obtenirLigne(c)), i) and
             not appartientChiffre(obtenirChiffresDUneColonne(g, obtenirColonne(c)), i) and
             not appartientChiffre(obtenirChiffresDUnCarre(g, obtenirCarre(c)), i) then
            ajouterChiffre(possible, i);
         end if;
      end loop;
      return possible;
   end obtenirSolutionsPossibles;

   ------------------------------------------
   -- rechercherSolutionUniqueDansEnsemble --
   ------------------------------------------

   function rechercherSolutionUniqueDansEnsemble
     (resultats : in Type_Ensemble) return Integer
   is
   begin
      if ensembleVide(resultats) then
         raise ENSEMBLE_VIDE;
      end if;
      if nombreChiffres(resultats) > 1 then
         raise PLUS_DE_UN_CHIFFRE;
      end if;
      for i in 1 .. 9 loop
         if appartientChiffre(resultats, i) then
            return i;
         end if;
      end loop;
      return 0;
   end rechercherSolutionUniqueDansEnsemble;

   --------------------------
   -- Placervaleursuniques --
   --------------------------
   --Anciennement, le resoudreSudoku de la première partie de la SAE
   procedure Placervaleursuniques(g : in out Type_Grille; trouve : out Boolean ; cpt : out Integer) is
      changement : Boolean := True;--Signifie qu'il y a encore des changements à faire
      solutions : Type_Ensemble;
      coordonnee : Type_Coordonnee;
   begin
      solutions:=construireEnsemble;
      cpt := 0;
      while changement loop
         changement := False;
         --On parcourt toute la grille
         for numLigne in 1 .. 9 loop
            for numColonne in 1 .. 9 loop
               coordonnee := construireCoordonnees(numLigne, numColonne);
               --Si la case est vide on peut commencer à chercher des solutions
               if caseVide(g, coordonnee) then
                  solutions := obtenirSolutionsPossibles(g, coordonnee);
                  --Si la fonction ne trouve qu'une seule solution
                  if nombreChiffres(solutions) = 1 then
                     changement := True;
                     --Elle place la valeur à la coordonnée
                     fixerChiffre (g, coordonnee, rechercherSolutionUniqueDansEnsemble(solutions), cpt);
                  end if;
               end if;
            end loop;
         end loop;
      end loop;
      trouve := estRemplie(g);
   end Placervaleursuniques;

   ------------------
   -- CaseSuivante --
   ------------------

   function CaseSuivante(coor : in Type_Coordonnee) return Type_Coordonnee is
      lig:Integer;
      col:Integer;
   begin
      lig:=obtenirLigne(coor);
      col:=obtenirColonne(coor);
      --Change de ligne si on arrive au bout de la ligne
      if col = 9 then
         lig := lig + 1;
         col := 1;
      else
         col := col + 1;
      end if;
      --Retourne à (1,1) si on arrive au bout de la grille
      if lig > 9 then
         lig:=1;
         col:=1;
      end if;
      return construireCoordonnees(lig,col);
   end CaseSuivante;

   ----------------
   -- Pilesdecas --
   ----------------

   procedure Pilesdecas (pile: in out Type_Pile; coordonnee : in Type_Coordonnee;
                         solutions: in Type_Ensemble) is
      caspossible:type_CasPossible;
   begin
      for valeur in 1..9 loop
         --Si la valeur se retrouve dans les solutions
         --On la rajoute
         if appartientChiffre(solutions,valeur) then
            --On crée un nouveau cas possible avec la coordonnee et la valeur
            --Qu'on empile ensuite
            caspossible:=construireCasPossible(coordonnee,valeur);
            pile:=empiler(pile,caspossible);
         end if;
      end loop;
   end Pilesdecas;

   ----------------
   -- Backtrack --
   ----------------

   procedure Backtrack (g : in Type_Grille ; grille_aux : in out Type_Grille;
                        coordonnee : in out Type_Coordonnee)
   is
      ccp : Type_Coordonnee;--Copie des coordonnee
   begin
      ccp := coordonnee;
      --Vider au préalable la case
      viderCase(grille_aux, coordonnee);
      --On parcourt toute la grille avec la copie des coordonnees
      while not (obtenirLigne(ccp)=9 and obtenirColonne(ccp)=9) loop
         --Si la case est vide dans g
         --Cela signifie que ce n'est pas une valeur unique
         --Et qui faut donc la supprimer
         if caseVide(g, ccp) and not caseVide(grille_aux, ccp) then
            viderCase(grille_aux, ccp);
         end if;
         --On passe à la case suivante
         ccp := CaseSuivante(ccp);
      end loop;
      --On vide la dernière case soit (9,9)
      if caseVide(g, ccp) and not caseVide(grille_aux, ccp) then
            viderCase(grille_aux, ccp);
      end if;
   end backtrack;

   --------------------
   -- resoudreSudoku --
   --------------------

   procedure resoudreSudoku(g : in out Type_Grille; trouve : out Boolean ;
                            cpt : out Integer) is
      solutions : Type_Ensemble;
      coordonnee : Type_Coordonnee;
      caspossible:type_CasPossible;
      pile: Type_Pile;
      --On crée une grille qu'on pourra modifier
      grille_aux:Type_Grille;
   begin
      --On place le plus de valeurs uniques possible
      placervaleursuniques(g,trouve,cpt);
      solutions:=construireEnsemble;
      pile:=construirePile;
      --g est une grille de référence pour savoir où se trouve les valeurs uniques
      grille_aux:=g;
      --On commence par la première case
      coordonnee:=construireCoordonnees(1,1);
      --On vérifie si la grille est remplie
      trouve:=estRemplie(g);
      --Sinon on passe par un autre programme
      if not trouve then
         --On cherche à remplir la grille auxiliaire
         while not estRemplie(grille_aux) loop
            --On vérifie si la case est vide dans la grille principale afin de travailler dessus
            if caseVide(g,coordonnee) then
               --On vérifie également dans la grille auxiliaire
               if caseVide(grille_aux,coordonnee) then
                  --On cherche toutes les solutions
                  solutions:=obtenirSolutionsPossibles(grille_aux,coordonnee);
                  --On les empile
                  Pilesdecas(pile,coordonnee,solutions);
                  --On change de coordonnées et on prend celle du dernier élément de la pile
                  caspossible:=dernier(pile);
                  coordonnee:=obtenirCoordonne(caspossible);
                  --Si aucune solution n'est trouvée on effectue le BackTracking
                  if ensembleVide(solutions) then
                     backtrack(g,grille_aux,coordonnee);
                  end if;
                  --On fixe la valeur à la coordonnée
                  fixerChiffre(grille_aux,coordonnee,obtenirValeur(caspossible),cpt);
                  pile:=depiler(pile);
               end if;
            end if;
            --Si la case est remplie on passe la case suivante
            coordonnee:=CaseSuivante(coordonnee);
         end loop;
         --A la fin on peut affecter la grille à la grille auxiliaire
         g:=grille_aux;
         trouve:=estRemplie(g);
      end if;
   end resoudreSudoku;

end resolutions;
