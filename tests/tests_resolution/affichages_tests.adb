-- Types
with TAD_Coordonnee;   use TAD_Coordonnee;
with TAD_ensemble;     use TAD_ensemble;
with TAD_grilleSudoku; use TAD_grilleSudoku;
--with TAD_CasPossible ; use TAD_CasPossible;
--with TAD_Pile ; use TAD_Pile;
-- Affichages
with affichage;           use affichage;
-- Resolution
with remplirGrille;       use remplirGrille;
with resolutions;         use resolutions;
-- E/S
with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure affichages_tests is
   g      : Type_Grille;
   c      : Type_Coordonnee;
   e  : Type_Ensemble;
    cpt : Integer := 0;

begin

   --------------------------------------
   -- Tests affichage de la grille
   --------------------------------------
   g := construireGrille;
   afficherGrille (g);

   --------------------------------------
   -- test affichage d'un ensemble
   --------------------------------------

   g := construireGrille;
   for i in 1 .. 9 loop
      c := construireCoordonnees (1, i);
      fixerChiffre (g, c, i, cpt);
   end loop;
   e := obtenirChiffresDUneLigne (g, 1);
   afficherEnsemble (e);
   New_Line;

   --------------------------------------
   -- Affichage de toutes les grilles
   --------------------------------------

   Put_Line ("********* Grille 1");
   g := grille1TresTresFacileDuNouvelAn2018;
   afficherGrille (g);

   Put_Line ("********* Grille 2");
   g := grille2TresTresFacile;
   afficherGrille (g);

   Put_Line ("********* Grille 3");
   g := grille3TresFacile;
   afficherGrille (g);

   Put_Line ("********* Grille 4");
   g := grille4Facile;
   afficherGrille (g);

   Put_Line ("********* Grille 6");
   g := grille6Moyen;
   afficherGrille (g);

   Put_Line ("********* Grille 7");
   g := grille7Difficile;
   afficherGrille (g);

   Put_Line ("********* Grille 8");
   g := grille8Difficile;
   afficherGrille (g);

   Put_Line ("********* Grille 9");
   g := grille9TresDifficile;
   afficherGrille (g);

end affichages_tests;
