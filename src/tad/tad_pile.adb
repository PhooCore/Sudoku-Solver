pragma Ada_2012;
package body TAD_Pile is

   --------------------
   -- construirePile --
   --------------------

   function construirePile return Type_Pile is
      pile : Type_Pile;
   begin
      return pile;
   end construirePile;

   -------------
   -- estVide --
   -------------

   function estVide(pile: in Type_Pile) return Boolean is
   begin
      return pile.nb_elements = 0;
   end estVide;

   -------------
   -- dernier --
   -------------

   function dernier(pile: in Type_Pile) return T is
   begin
      if estVide(pile) then
         raise PILE_VIDE;
      else
         return pile.elements(pile.nb_elements);
      end if;
   end dernier;

   -------------
   -- empiler --
   -------------

   function empiler(pile: in Type_Pile; e: in T) return Type_Pile is
      nvpile: Type_Pile := pile;
   begin
      if pile.nb_elements = TAILLE_MAX then
         raise PILE_PLEINE;
      else
         nvpile.nb_elements := nvpile.nb_elements + 1;
         nvpile.elements(nvpile.nb_elements) := e;
         return nvpile;
      end if;
   end empiler;

   -------------
   -- depiler --
   -------------

   function depiler(pile: in Type_Pile) return Type_Pile is
      nvpile : Type_Pile := pile;
   begin
      if estVide(pile) then
         raise PILE_VIDE;
      else
         nvpile.nb_elements := nvpile.nb_elements - 1;
         return nvpile;
      end if;
   end depiler;

end TAD_Pile;
