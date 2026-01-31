-- TAD
with TAD_ensemble;      use TAD_ensemble;
with Pile_CasPossibles; use Pile_CasPossibles;
with TAD_Coordonnee;    use TAD_Coordonnee;
with casPossible;       use casPossible;
-- affichages
with affichage; use affichage;
-- E/S
with Ada.Text_IO;           use Ada.Text_IO;
with Ada.Integer_Text_IO;   use Ada.Integer_Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

procedure testEmpilerCasPossible is

   --  procedure afficher (cp : type_CasPossible) is
   --  begin
   --     Put ("valeur empilee : ");
   --     Put ("c(");
   --     Put (obtenirLigne (obtenirCoordonne (cp)), 0);
   --     Put (",");
   --     Put (obtenirColonne (obtenirCoordonne (cp)), 0);
   --     Put ("), ");
   --     Put (obtenirValeur (cp), 0);
   --     New_Line;
   --  end afficher;

   function Ensemble2PileCasPossible
     (c : in Type_Coordonnee; e : in Type_Ensemble) return Type_Pile
   is
      p : Type_Pile;
   begin
      p := construirePile;
      for i in 1 .. 9 loop
         if appartientChiffre (e, i) then
            p := empiler (p, construireCasPossible (c, i));
         end if;
      end loop;
      return p;
   end Ensemble2PileCasPossible;

   e  : Type_Ensemble;
   c  : Type_Coordonnee;
   p  : Type_Pile;
   cp : type_CasPossible;

begin
   -- pile
   p := construirePile;
   -- coordonnée
   c := construireCoordonnees (2, 4);
   -- test empilement
   p  := empiler (p, construireCasPossible (c, 6));
   cp := dernier (p);
   afficher (cp);
   -- ensemble
   e := construireEnsemble;
   ajouterChiffre (e, 1);
   ajouterChiffre (e, 3);
   ajouterChiffre (e, 5);
   -- test empilement ensemble
   p := depiler (p);
   p := Ensemble2PileCasPossible (c, e);
   while not estVide (p) loop
      afficher (dernier (p));
      p := depiler (p);
   end loop;

end testEmpilerCasPossible;
