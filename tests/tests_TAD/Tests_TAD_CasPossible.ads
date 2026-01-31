with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with tests;                 use tests;

package tests_TAD_CasPossible is

   -- tests TAD CasPossibles
   function test_CasPossibles_P1 return Boolean;
   function test_CasPossibles_P2 return Boolean;

   les_Tests : constant array (Positive range <>) of Test_Unitaire :=
     ((test_CasPossibles_P1'Access,
       To_Unbounded_String ("echec de la propriete 1 CasPossibles")),
      (test_CasPossibles_P2'Access,
       To_Unbounded_String ("echec de la propriete 2 CasPossibles"))
      );

   resultats : array (les_Tests'Range) of Boolean;

end tests_TAD_CasPossible;
