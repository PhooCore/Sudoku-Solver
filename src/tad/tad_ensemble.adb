package body TAD_ensemble is

  -- retourne un ensemble vide
   function construireEnsemble return Type_Ensemble is
      e : Type_Ensemble;
   begin
      for i in 1..9 loop
         e(i) := False;
      end loop;
      return e;
   end construireEnsemble;

   -- retourne VRAI si l'ensemble e est vide et FAUX sinon
   function ensembleVide (e : in Type_Ensemble) return Boolean is
   begin
      for i in 1..9 loop
          if e(i) = True then
            return False;
          end if;
      end loop;
      return True;
   end ensembleVide;

-- retourne VRAI si le chiffre v est present dans l'ensemble ep
   function appartientChiffre
     (e : in Type_Ensemble; v : Integer) return Boolean
      is
   begin
      if e(v) = True then
         return True;
      end if;
      return False;
   end appartientChiffre;


   function nombreChiffres (e : in Type_Ensemble) return Integer is
      compteur : Integer;
   begin
      compteur := 0;
      for i in 1..9 loop
         if e(i) = True then
            compteur := compteur + 1;
         end if;
      end loop;
      return compteur;
   end nombreChiffres;

   -- ajoute le chiffre v dans l'ensemble e
   -- nécessite l'element v n'existe pas dans l'ensemble e
   -- lève l'exception APPARTIENT_ENSEMBLE si v appartient à l'ensemble
   procedure ajouterChiffre (e : in out Type_Ensemble; v : in Integer) is
   begin
      if e(v)=True then
         raise APPARTIENT_ENSEMBLE;
      else
         e(v) := True;
      end if;
   end ajouterChiffre;

   -- supprime le chiffre v dans l'ensemble e
   -- nécessite l'element v existe dans l'ensemble e
   -- lève l'exception NON_APPARTIENT_ENSEMBLE si v n'appartient pas à l'ensemble
   procedure retirerChiffre (e : in out Type_Ensemble; v : in Integer) is
   begin
      if e(v) = False then
         raise NON_APPARTIENT_ENSEMBLE;
      else
         e(v) := False;
      end if;
   end retirerChiffre;

end TAD_ensemble;
