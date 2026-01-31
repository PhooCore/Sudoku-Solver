-- bibliothèques d'entrée sortie
with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
-- TAD
with TAD_Coordonnee; use TAD_Coordonnee;
with casPossible; use casPossible;

package body tests_TAD_CasPossible is

   -----------------------
   -- tests CasPossibles --
   -----------------------

   -- c : case;
   -- test obtenirLigne
   function test_CasPossibles_P1 return Boolean is
      c : Type_CasPossible;
      co : Type_Coordonnee;
      ligne : Integer;
      colonne : Integer;
   begin
      co := construireCoordonnees(3,4);
      c := construireCasPossible (co, 2);
      ligne := obtenirLigne(obtenirCoordonne (c));
      colonne := obtenirColonne(obtenirCoordonne(c));
      return ligne = 3 and colonne = 4;
   exception
      when others =>
         return False;
   end test_CasPossibles_P1;

   -- test obtenirColonne
   function test_CasPossibles_P2 return Boolean is
      c : Type_CasPossible;
      co : Type_Coordonnee;
   begin
      co := construireCoordonnees(3,4);
      c := construireCasPossible (co, 2);
      return (obtenirValeur (c) = 2);
   exception
      when others =>
         return False;
   end test_CasPossibles_P2;

end tests_TAD_CasPossible;
