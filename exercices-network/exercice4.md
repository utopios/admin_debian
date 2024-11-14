## Exercice : Transfert sécurisé de fichiers avec scp et sftp

**Objectif** :

Apprendre à transférer des fichiers entre le client et le serveur de manière sécurisée en utilisant scp et sftp.

**Instructions** :
	1.	Tâches à réaliser avec scp :
a. Depuis le client, utilisez scp pour copier le fichier /home/user/document.txt vers le serveur dans le répertoire /home/adminuser/documents/.
b. Depuis le serveur, utilisez scp pour copier le fichier /var/log/syslog vers le client dans le répertoire /home/user/logs/.
	2.	Tâches à réaliser avec sftp :
a. Connectez-vous au serveur via sftp.
b. Naviguez jusqu’au répertoire /home/adminuser/documents/ sur le serveur.
c. Téléchargez le fichier report.pdf vers le répertoire /home/user/downloads/ sur le client.
d. Chargez le fichier update.sh depuis le client vers le répertoire /home/adminuser/scripts/ sur le serveur.
	3.	Utilisation de rsync sur SSH :
a. Synchronisez le répertoire /home/user/projects/ du client avec /home/adminuser/projects/ sur le serveur en utilisant rsync.
b. Assurez-vous que seules les modifications sont transférées et que les permissions sont préservées.
	4.	Vérifications :
	•	Confirmez que les fichiers ont été correctement transférés et sont intacts.
	•	Vérifiez les permissions et les propriétaires des fichiers transférés.
	5.	Questions de réflexion :
	•	Dans quels cas préféreriez-vous utiliser rsync plutôt que scp ou sftp ?
	•	Comment assurer la sécurité lors du transfert de fichiers sensibles ?