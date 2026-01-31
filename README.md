# 🧩 Sudoku Solver – Ada Project

Solveur de Sudoku complet développé en **Ada**, reposant sur une architecture modulaire et plusieurs algorithmes de résolution. Le projet prend en charge des formats de grilles standards et personnalisés (`.txt`, `.grp`) et s’appuie sur une suite de tests permettant de valider le bon fonctionnement des algorithmes.

---
## Table des matières

* [Présentation du projet](#présentation-du-projet)
* [Fonctionnalités](#fonctionnalités)
* [Tester le projet](#tester-le-projet)
* [Architecture du code](#architecture-du-code)
* [Auteur](#auteur)
* [Licence](#licence)

## Présentation du projet

Ce projet a été réalisé durant la **1ʳᵉ année de BUT Informatique**, en groupe de 4, dans le cadre de la **SAÉ 2.02 : Exploration algorithmique d’un problème**.

L’objectif est de résoudre automatiquement des grilles de Sudoku de différents niveaux de difficulté. Pour cela, plusieurs approches algorithmiques sont combinées afin d’obtenir une résolution fiable, progressive et compréhensible.

Le projet met l’accent sur :

* la structuration du code en **Types Abstraits de Données (TAD)**,
* la clarté des algorithmes,
* la testabilité des différentes fonctionnalités.

---

## Fonctionnalités

* Algorithme de **backtracking**
* Recherche de **valeurs uniques** (singletons)
* Gestion stricte des contraintes (lignes, colonnes, carrés)
* Architecture modulaire basée sur des TAD en Ada
* Affichage lisible des grilles avant et après résolution
* Support des fichiers de grilles aux formats **`.txt`** et **`.grp`**

---

## Tester le projet

Pour tester le solveur sur l’ensemble des grilles fournies, il est recommandé d’exécuter le programme suivant :

* **`tester_toutes_grilles.adb`**

Ce fichier lance automatiquement la résolution de toutes les grilles disponibles et affiche les résultats.

📁 Emplacement :

```
tests/tests_resolution/
```

### Important

Pour disposer de **l’ensemble des fichiers nécessaires dès l’ouverture du projet dans GNAT Studio (ou tout autre IDE Ada)**, il est indispensable de :

* télécharger et conserver le fichier **`sudoku.grp`**,

Sans ce fichier, certains tests ou chargements de grilles ne pourront pas être exécutés correctement.

---

## Architecture du code

Le projet est structuré en plusieurs dossiers afin de séparer clairement les responsabilités.

### 📁 grilles/

Contient l’ensemble des grilles de Sudoku au format `.txt` ainsi que les fichiers `.grp` nécessaires aux tests.

---

### 📁 src/

#### resolution/

Ce dossier regroupe les modules responsables de :

* l’affichage des grilles,
* le chargement des grilles depuis les fichiers,
* la résolution du Sudoku à l’aide des différentes méthodes implémentées.

#### tad/

Contient l’ensemble des **Types Abstraits de Données**, utilisés pour structurer proprement le projet (coordonnées, ensembles de valeurs possibles, grille de Sudoku, piles, etc.).

---

### 📁 tests/

Ce dossier contient les programmes de test.

* **`run_all_tests`** : permet de lancer l’ensemble des tests automatiquement

#### tests_resolution/

Tests dédiés aux algorithmes de résolution (validité des solutions, comportement sur différentes grilles).

#### tests_TAD/

Tests unitaires des différents TAD afin de vérifier leur bon fonctionnement indépendamment des algorithmes de résolution.

---

## Auteur

* **NGUYEN Tuyet Phuong** | [GitHub-PhooCore](https://github.com/PhooCore)
* **CORBILLÉ Iris**  | [GitHub-iriscrbl](https://github.com/iriscrbl)
* **AHMAD FAISAL Aneesa**
* **MUNKH ERDENE Dulguun**

Projet réalisé dans le cadre de la 2e année de BUT Informatique.

---


## Licence

Projet académique réalisé à des fins pédagogiques.

⭐ *Si ce projet vous a été utile, n’hésitez pas à lui donner une étoile !*
