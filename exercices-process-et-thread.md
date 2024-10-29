### Exercices Simples

1.	Lister les processus actifs :
•	Utilise la commande ps aux pour afficher tous les processus en cours. Identifie les processus appartenant à l’utilisateur root et ceux de ton propre utilisateur.
```bash
ps aux
ps aux | grep '^root'
ps aux | grep '^ihab'
```
2.	Suivre l’utilisation du CPU et de la mémoire :
•	Lance la commande top et observe les processus qui consomment le plus de CPU et de mémoire. Trie les processus par %CPU en utilisant Shift + P, puis par %MEM en utilisant Shift + M.^

```bash
top
```

3.	Repérer et tuer un processus :
•	Lance un processus (par exemple, en démarrant sleep 1000 &). Utilise ps pour le repérer, puis termine-le avec la commande kill en utilisant son PID.

```bash
sleep 1000 &
ps aux | grep sleep
kill -9 PID
```
4.	Utilisation de pstree :
•	Exécute la commande pstree et observe la hiérarchie des processus. Identifie le processus parent de ton shell actuel et liste les processus enfants.

```bash
pstree -p 
pstree ihab
```

5.	Lister les threads d’un processus spécifique :
•	Choisis un processus (comme top ou htop), utilise ps -eLf | grep <PID> pour afficher les threads associés et observe leur nombre.
```bash
ps -eLf | grep 

```
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

#### Correction

Exercices Simples

	1.	Lister les processus actifs
	•	Commande :

ps aux


	•	Pour voir les processus du root :

ps aux | grep '^root'


	•	Pour voir tes propres processus (remplace <username> par ton nom d’utilisateur) :

ps aux | grep '^<username>'


	2.	Suivre l’utilisation du CPU et de la mémoire
	•	Ouvre un terminal et lance top :

top


	•	Pour trier par %CPU :
	•	Appuie sur Shift + P.
	•	Pour trier par %MEM :
	•	Appuie sur Shift + M.

	3.	Repérer et tuer un processus
	•	Lancer un processus en arrière-plan (par exemple, sleep 1000 &) :

sleep 1000 &


	•	Utiliser ps pour le repérer :

ps aux | grep sleep


	•	Note le PID du processus (par exemple, 1234), puis tue-le :

kill 1234


	4.	Utilisation de pstree
	•	Affiche la hiérarchie des processus :

pstree


	•	Affiche l’arbre avec les PID :

pstree -p


	•	Pour un utilisateur spécifique :

pstree <nom_utilisateur>


	5.	Lister les threads d’un processus spécifique
	•	Choisis un processus, comme top, lance-le puis récupère son PID.
	•	Utilise la commande suivante pour afficher les threads associés :

ps -eLf | grep <PID_du_processus>


	6.	Comparaison top et htop
	•	Lance top et htop dans deux terminaux différents :

top
htop


	•	Observe les informations et fais attention aux différences d’interface et d’organisation.

Exercices Intermédiaires

	7.	Analyser les processus sans terminal
	•	Commande :

ps x


	•	Cela affichera les processus sans terminal associé (comme ceux en arrière-plan).

	8.	Surveillance en temps réel d’un processus lourd
	•	Lance un programme qui utilise le CPU (si installé, stress est une bonne option) :

sudo apt install stress
stress --cpu 2 --timeout 60


	•	Ouvre top dans un autre terminal pour observer son impact :

top


	•	Observe comment la charge CPU augmente avec stress.

	9.	Explorer les priorités avec nice et renice
	•	Démarre un processus avec une priorité élevée :

nice -n -10 sleep 1000 &


	•	Démarre un autre processus avec une priorité basse :

nice -n 10 sleep 1000 &


	•	Utilise top pour observer leur priorité (colonne PR).
	•	Utilise renice pour changer la priorité d’un processus (par exemple, avec PID 1234) :

renice 5 -p 1234


	10.	Identifier un processus avec des critères spécifiques
	•	Affiche les processus en cours et filtre avec grep (par exemple, pour sleep) :

ps aux | grep sleep


	•	Cette commande affichera tous les processus dont le nom contient “sleep”.

Exercices Avancés : Exemple de Solution

	11.	Créer et gérer des processus multiples avec pstree

	•	Crée un script bash pour générer des processus enfants :

#!/bin/bash
for i in {1..5}
do
    sleep 1000 &
done
wait


	•	Exécute le script, puis utilise pstree pour voir l’arborescence des processus créés :

./script_name.sh &
pstree -p



	12.	Surveillance des ressources système en continu

	•	Écris un script qui enregistre l’utilisation du CPU et de la mémoire toutes les 5 secondes :

#!/bin/bash
while true
do
    echo "Enregistrement à $(date)" >> usage.log
    ps aux --sort=-%mem | head -n 5 >> usage.log
    echo "----------------------------------------" >> usage.log
    sleep 5
done

