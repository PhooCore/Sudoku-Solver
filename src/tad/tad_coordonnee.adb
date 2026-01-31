pragma Ada_2012;
package body TAD_Coordonnee is

   ---------------------------
   -- construireCoordonnees --
   ---------------------------

   function construireCoordonnees
     (ligne : Integer; colonne : Integer) return Type_Coordonnee
   is
   begin
      return ( Ligne => ligne , Colonne => colonne);
   end construireCoordonnees;

   ------------------
   -- obtenirLigne --
   ------------------

   function obtenirLigne (c : Type_Coordonnee) return Integer is
   begin
      return c.Ligne;
   end obtenirLigne;

   --------------------
   -- obtenirColonne --
   --------------------

   function obtenirColonne (c : Type_Coordonnee) return Integer is
   begin
      return c.Colonne;
   end obtenirColonne;

   ------------------
   -- obtenirCarre --
   ------------------

   function obtenirCarre (c : Type_Coordonnee) return Integer is
   begin
      return ((c.ligne - 1) / 3 ) * 3 + ((c.colonne - 1) / 3) + 1 ;
   end obtenirCarre;

   ----------------------------
   -- obtenirCoordonneeCarre --
   ----------------------------

   function obtenirCoordonneeCarre (numCarre : Integer) return Type_Coordonnee
   is
   begin
       return (ligne => ((numCarre - 1) / 3) * 3 + 1, colonne => ((numCarre - 1) mod 3) * 3+ 1);
   end obtenirCoordonneeCarre;

end TAD_Coordonnee;
