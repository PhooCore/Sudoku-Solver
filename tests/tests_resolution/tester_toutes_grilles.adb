with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with TAD_grilleSudoku;    use TAD_grilleSudoku;
with affichage;           use affichage;
with resolutions;         use resolutions;
with remplirGrille;       use remplirGrille;

procedure tester_toutes_grilles is
   
   -- Type pour les informations sur chaque grille
   type Info_Grille is record
      nom : String(1..40);  -- Longueur réduite à 40 caractères
      fonction : access function return Type_Grille;
   end record;
   
   -- Tableau des 9 grilles à tester (noms tronqués à 40 caractères)
   grilles : constant array(1..9) of Info_Grille := (
      (nom => "Grille 1 : Tres Tres Facile (2018)      ", 
       fonction => grille1TresTresFacileDuNouvelAn2018'Access),
      (nom => "Grille 2 : Tres Tres Facile             ", 
       fonction => grille2TresTresFacile'Access),
      (nom => "Grille 3 : Tres Facile                  ", 
       fonction => grille3TresFacile'Access),
      (nom => "Grille 4 : Facile                       ", 
       fonction => grille4Facile'Access),
      (nom => "Grille 5 : Facile                       ", 
       fonction => grille5Facile'Access),
      (nom => "Grille 6 : Moyen                        ", 
       fonction => grille6Moyen'Access),
      (nom => "Grille 7 : Difficile                    ", 
       fonction => grille7Difficile'Access),
      (nom => "Grille 8 : Difficile                    ", 
       fonction => grille8Difficile'Access),
      (nom => "Grille 9 : Tres Difficile               ", 
       fonction => grille9TresDifficile'Access)
   );
   
   -- Variables pour chaque test
   g : Type_Grille;
   trouve : Boolean;
   cpt : Integer;
   total_succes : Integer := 0;
   total_placements : Integer := 0;
   
begin
   -- En-tête du programme
   Put_Line("========================================================");
   Put_Line("       TEST COMPLET DES 9 GRILLES DE SUDOKU            ");
   Put_Line("========================================================");
   New_Line(2);
   
   -- Test de chaque grille
   for i in grilles'Range loop
      -- Afficher le numéro et le nom de la grille
      Put("=== GRILLE ");
      Put(i, 1);
      Put(" : ");
      Put(grilles(i).nom);
      Put_Line(" ===");
      New_Line;
      
      -- Charger la grille depuis le fichier
      Put("Fichier: grille");
      Put(i, 1);
      case i is
         when 1 => Put_Line("TresTresFacileDuNouvelAn2018.txt");
         when 2 => Put_Line("TresTresFacile.txt");
         when 3 => Put_Line("TresFacile.txt");
         when 4 => Put_Line("Facile.txt");
         when 5 => Put_Line("Facile.txt");
         when 6 => Put_Line("Moyen.txt");
         when 7 => Put_Line("Difficile.txt");
         when 8 => Put_Line("Difficile.txt");
         when 9 => Put_Line("TresDifficile.txt");
      end case;
      New_Line;
      
      -- Obtenir la grille via la fonction
      g := grilles(i).fonction.all;
      
      -- Afficher la grille initiale
      Put_Line("GRILLE INITIALE :");
      afficherGrille(g);
      
      -- Résoudre la grille
      cpt := 0;
      Put_Line("Resolution en cours...");
      resoudreSudoku(g, trouve, cpt);
      
      -- Afficher la grille résolue
      Put_Line("GRILLE RESOLUE :");
      afficherGrille(g);
      
      -- Afficher le résultat
      if trouve then
         Put("SUCCES : Grille resolue avec ");
         Put(cpt, 0);
         Put_Line(" placements");
         total_succes := total_succes + 1;
      else
         Put("RESULTAT PARTIEL : ");
         Put(cpt, 0);
         Put_Line(" placements effectues");
         Put("Cases restantes : ");
         Put(81 - nombreChiffres(g), 0);
         Put_Line("/81");
      end if;
      
      total_placements := total_placements + cpt;
      
      -- Séparateur entre les grilles
      if i < 9 then
         New_Line(2);
         Put_Line("--------------------------------------------------------");
         New_Line(2);
      end if;
   end loop;
   
   -- Résumé final
   New_Line(2);
   Put_Line("========================================================");
   Put_Line("                   RESUME DES TESTS                    ");
   Put_Line("========================================================");
   New_Line;
   
   Put_Line("STATISTIQUES :");
   Put("  Grilles testees : 9");
   New_Line;
   Put("  Grilles resolues : ");
   Put(total_succes, 0);
   Put_Line("/9");
   Put("  Taux de reussite : ");
   Put(total_succes * 100 / 9, 0);
   Put_Line("%");
   Put("  Total des placements : ");
   Put(total_placements, 0);
   Put_Line(" chiffres places");
   Put("  Moyenne par grille : ");
   if total_placements > 0 then
      Put(total_placements / 9, 0);
   else
      Put("0");
   end if;
   Put_Line(" placements/grille");
   
   New_Line;
   Put_Line("NIVEAUX DE DIFFICULTE :");
   Put_Line("  1-2 : Tres Tres Facile");
   Put_Line("  3   : Tres Facile");
   Put_Line("  4-5 : Facile");
   Put_Line("  6   : Moyen");
   Put_Line("  7-8 : Difficile");
   Put_Line("  9   : Tres Difficile");
   
   New_Line;
   if total_succes = 9 then
      Put_Line("EXCELLENT ! Toutes les grilles ont ete resolues avec succes !");
   elsif total_succes >= 7 then
      Put_Line("TRES BON ! La plupart des grilles ont ete resolues.");
   elsif total_succes >= 5 then
      Put_Line("CORRECT ! Plus de la moitie des grilles sont resolues.");
   else
      Put_Line("A AMELIORER ! Moins de la moitie des grilles sont resolues.");
   end if;
   
   New_Line;
   Put_Line("========================================================");
   Put("           FIN DU TEST - ");
   if total_succes = 9 then
      Put_Line("SUCCES TOTAL              ");
   else
      Put_Line("RESULTATS PARTIELS        ");
   end if;
   Put_Line("========================================================");
   
end tester_toutes_grilles;
