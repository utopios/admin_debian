### Exercices Simples

1.	Lister les processus actifs :
•	Utilise la commande ps aux pour afficher tous les processus en cours. Identifie les processus appartenant à l’utilisateur root et ceux de ton propre utilisateur.
2.	Suivre l’utilisation du CPU et de la mémoire :
•	Lance la commande top et observe les processus qui consomment le plus de CPU et de mémoire. Trie les processus par %CPU en utilisant Shift + P, puis par %MEM en utilisant Shift + M.
3.	Repérer et tuer un processus :
•	Lance un processus (par exemple, en démarrant sleep 1000 &). Utilise ps pour le repérer, puis termine-le avec la commande kill en utilisant son PID.
4.	Utilisation de pstree :
•	Exécute la commande pstree et observe la hiérarchie des processus. Identifie le processus parent de ton shell actuel et liste les processus enfants.
5.	Lister les threads d’un processus spécifique :
•	Choisis un processus (comme top ou htop), utilise ps -eLf | grep <PID> pour afficher les threads associés et observe leur nombre.
6.	Comparaison top et htop :
•	Lance top et htop côte à côte dans deux terminaux. Compare les informations affichées et les différences d’interface.

---

### Exercices Intermédiaires

7.	Analyser les processus sans terminal :
•	Utilise ps x pour afficher les processus sans terminal (processus en arrière-plan). Choisis un processus sans terminal et observe ses caractéristiques (CPU, mémoire, utilisateur, etc.).
8.	Surveillance en temps réel d’un processus lourd :
•	Démarre un processus qui utilise intensivement le CPU (comme stress pour simuler une charge, ou lance un programme gourmand). Utilise top pour surveiller son impact sur le système.
9.	Explorer les priorités avec nice et renice :
•	Lance un processus avec une priorité élevée et un autre avec une priorité basse en utilisant nice. Utilise ensuite renice pour modifier la priorité d’un des processus. Observe leur comportement avec top.
10.	Identifier un processus avec des critères spécifiques :
•	Utilise ps pour afficher les processus en cours et filtre les résultats avec grep pour trouver un processus précis (par nom ou utilisateur). Essaye de créer une commande ps aux | grep <critère> pour cela.

---

### Exercices Avancés

11.	Créer et gérer des processus multiples avec pstree :
•	Crée plusieurs processus en arrière-plan et observe leur hiérarchie avec pstree -p. Lance des processus enfants depuis un script bash et analyse leur structure hiérarchique avec pstree.
12.	Surveillance des ressources système en continu :
•	Écris un script bash qui utilise ps et top pour enregistrer l’utilisation du CPU et de la mémoire toutes les 5 secondes dans un fichier. Analyse les résultats pour identifier les moments où la charge système augmente.
13.	Détection d’un processus zombie :
•	Lance un processus puis arrête brutalement son parent (simule une erreur en tuant le processus parent). Utilise ps pour repérer si le processus enfant reste sous forme de “zombie”.
14.	Utilisation de htop pour gérer un système sous forte charge :
•	Crée une charge système importante en démarrant plusieurs processus gourmands. Utilise htop pour identifier les processus les plus coûteux et réduire l’utilisation du CPU en ajustant les priorités.
15.	Script de tri et d’alerte des processus gourmands :
•	Écris un script qui utilise ps aux pour trier les processus par consommation de CPU et de mémoire. Le script doit envoyer une alerte (afficher un message ou envoyer un email) si un processus dépasse un certain seuil de consommation.
16.	Lister les processus d’un utilisateur spécifique et tuer automatiquement les plus gourmands :
•	Écris un script qui utilise ps pour surveiller les processus d’un utilisateur spécifique. Le script doit terminer automatiquement les processus dépassant un seuil de CPU prédéfini.

---

## Exercices Experts

17.	Analyse de l’arbre de processus pour une application complexe :
•	Installe une application serveur (comme Apache ou MySQL) et utilise pstree pour observer la structure de ses processus enfants. Rédige un rapport expliquant la hiérarchie des processus et leurs relations.
18.	Surveillance avancée et génération de rapports :
•	Crée un script qui exécute top pendant une période définie (par exemple, 1 heure), enregistre les 5 processus les plus gourmands chaque minute, et génère un rapport final. Inclue des statistiques comme le processus le plus gourmand en CPU/mémoire, le nombre de changements dans le top 5, etc.
19.	Automatisation de la gestion de priorité en fonction de la charge :
•	Écris un programme qui surveille en continu l’utilisation du CPU via ps. Si la charge CPU dépasse un certain seuil, le programme ajuste automatiquement la priorité des processus les moins importants.
20.	Détection et gestion automatisée des processus zombies :
•	Développe un script qui utilise ps pour rechercher les processus zombies toutes les minutes. Si un zombie est détecté, le script doit tenter de redémarrer le processus parent (si applicable) et notifier l’administrateur.
