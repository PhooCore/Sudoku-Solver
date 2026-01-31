pragma Ada_2012;
package body casPossible is

   ---------------------------
   -- construireCasPossible --
   ---------------------------

   function construireCasPossible
     (c : Type_Coordonnee; v : Integer) return type_CasPossible
   is
   begin

      return (caseGrille => c, valeurPossible => v);

   end construireCasPossible;

   ----------------------
   -- obtenirCoordonne --
   ----------------------

   function obtenirCoordonne (cp : Type_CasPossible) return Type_Coordonnee is
   begin

      return cp.caseGrille;

   end obtenirCoordonne;

   -------------------
   -- obtenirValeur --
   -------------------

   function obtenirValeur (cp : Type_CasPossible) return Integer is
   begin

      return cp.valeurPossible;

   end obtenirValeur;

end casPossible;
