pragma Ada_2012;
package body TAD_grilleSudoku is

   ----------------------
   -- construireGrille --
   ----------------------

   function construireGrille return Type_Grille is
      Result : Type_Grille:= (others => (others => 0));
   begin
      return Result ;
   end construireGrille;
   --------------
   -- caseVide --
   --------------

   function caseVide
     (g : in Type_Grille; c : in Type_Coordonnee) return Boolean
   is
   begin
      if g(obtenirLigne(c),obtenirColonne(c)) = 0 then
         return True;
      else
         return False;
      end if;
   end caseVide;

   --------------------
   -- obtenirChiffre --
   --------------------

   function obtenirChiffre
     (g : in Type_Grille; c : in Type_Coordonnee) return Integer
   is
   begin
      if caseVide(g,c) then
         raise OBTENIR_CHIFFRE_NUL;
      else
         return g(obtenirLigne(c),obtenirColonne(c)) ;
      end if;
   end obtenirChiffre;

   --------------------
   -- nombreChiffres --
   --------------------

   function nombreChiffres (g : in Type_Grille) return Integer is
      compteur:Integer;
   begin
      compteur:=0;
      for i in  1..9 loop
         for j in  1..9 loop
            if not caseVide(g, construireCoordonnees(i, j)) then
               compteur:=compteur + 1;
            end if;
         end loop;
      end loop;
      return compteur;
   end nombreChiffres;

   ------------------
   -- fixerChiffre --
   ------------------

   procedure fixerChiffre
     (g   : in out Type_Grille; c : in Type_Coordonnee; v : in Integer;
      cpt : in out Integer)
   is
   begin
      if not caseVide(g,c) then
         raise FIXER_CHIFFRE_NON_NUL;
      end if;
      g(obtenirLigne(c),obtenirColonne(c)):=v;
      cpt:=cpt+1;
   end fixerChiffre;

   ---------------
   -- viderCase --
   ---------------

   procedure viderCase (g : in out Type_Grille; c : in out Type_Coordonnee) is
   begin
      if caseVide(g,c) then
         raise VIDER_CASE_VIDE;
      else
         g(obtenirLigne(c),obtenirColonne(c)) := 0;
      end if;
   end viderCase;
   ----------------
   -- estRemplie --
   ----------------

   function estRemplie (g : in Type_Grille) return Boolean is
   begin
      return nombreChiffres(g) = 81;
   end estRemplie;

   ------------------------------
   -- obtenirChiffresDUneLigne --
   ------------------------------

   function obtenirChiffresDUneLigne
     (g : in Type_Grille; numLigne : in Integer) return Type_Ensemble
   is
      result : Type_Ensemble;
      c : Type_Coordonnee;
   begin
      result := construireEnsemble;
      for col in 1 .. 9 loop
         c := construireCoordonnees(numLigne, col);
         if not caseVide(g, c) then
            ajouterChiffre(result, obtenirChiffre(g, c));
         end if;
      end loop;
      return result;
   end obtenirChiffresDUneLigne;

   --------------------------------
   -- obtenirChiffresDUneColonne --
   --------------------------------

   function obtenirChiffresDUneColonne(g: in Type_Grille; numColonne : in Integer) return Type_Ensemble is
      e : Type_Ensemble;
      c : Type_Coordonnee;
   begin
      e := construireEnsemble;
      for i in 1 .. 9 loop
         c := construireCoordonnees(i, numColonne);
         if not caseVide(g, c) then
            ajouterChiffre(e, obtenirChiffre(g, c));
         end if;
      end loop;
      return e;
   end obtenirChiffresDUneColonne;

   -----------------------------
   -- obtenirChiffresDUnCarre --
   -----------------------------

   function obtenirChiffresDUnCarre(g: in Type_Grille; numCarre : in Integer) return Type_Ensemble is
      c : Type_Coordonnee;
      e : Type_Ensemble;
   begin
      e := construireEnsemble;
      c := obtenirCoordonneeCarre(numCarre);
      for i in obtenirLigne(c) .. obtenirLigne(c) + 2 loop
         for j in obtenirColonne(c) .. obtenirColonne(c) + 2 loop
            if not caseVide(g, construireCoordonnees(i, j)) then
               ajouterChiffre(e, obtenirChiffre(g, construireCoordonnees(i, j)));
            end if;
         end loop;
      end loop;
      return e;
   end obtenirChiffresDUnCarre;

end TAD_grilleSudoku;
