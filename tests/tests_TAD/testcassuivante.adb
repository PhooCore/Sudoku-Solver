-- TAD
with TAD_Coordonnee; use TAD_Coordonnee;
-- affichages
with affichage; use affichage;
-- E/S
with Ada.Text_IO;           use Ada.Text_IO;
with Ada.Integer_Text_IO;   use Ada.Integer_Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

procedure testCasSuivante is

   procedure afficher (c : Type_Coordonnee) is
   begin
      Put ("c(");
      Put (obtenirLigne (c), 0);
      Put (",");
      Put (obtenirColonne (c), 0);
      Put_Line (")");
   end afficher;

   function caseSuivante (c : in Type_Coordonnee) return Type_Coordonnee is
      new_c   : Type_Coordonnee;
      ligne   : Integer;
      colonne : Integer;
   begin
      ligne   := (obtenirLigne (c));
      colonne := (obtenirColonne (c));
      if colonne=9 then
         colonne := 1;
         if ligne=9 then
            ligne := 1 ;
         else
            ligne := ligne + 1;
         end if;
      else
            colonne := colonne + 1;
      end if;
      new_c   := construireCoordonnees (ligne, colonne);
      return new_c;
   end caseSuivante;

   c : Type_Coordonnee;

begin
   -- coordonnée
   c := construireCoordonnees (1, 1);
   -- test coordonnee suivante
   for i in 1 .. 100 loop
      c := caseSuivante (c);
      afficher (c);
   end loop;

end testCasSuivante;
