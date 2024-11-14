### Exercice : Sécurisation du serveur SSH

**Objectif** :

Configurer et sécuriser le serveur SSH sur Debian 12 pour permettre une administration à distance sécurisée.

**Instructions** :
	1.	Tâches à réaliser :
a. Installez le serveur SSH si ce n’est pas déjà fait.
b. Changez le port SSH par défaut de 22 à 2200 dans le fichier /etc/ssh/sshd_config.
c. Désactivez l’authentification par mot de passe pour forcer l’utilisation des clés SSH.
d. Créez une paire de clés SSH sur le client (votre machine locale).
e. Copiez la clé publique sur le serveur pour l’utilisateur adminuser.
f. Redémarrez le service SSH pour appliquer les changements.
g. Mettez à jour les règles du pare-feu UFW pour autoriser le nouveau port SSH.
	2.	Vérifications :
	•	Essayez de vous connecter au serveur via SSH en utilisant la clé privée.
	•	Assurez-vous que la connexion par mot de passe est refusée.
	•	Testez la connexion sur le nouveau port (2200).
	3.	Questions de réflexion :
	•	Quels sont les avantages de l’utilisation des clés SSH par rapport à l’authentification par mot de passe ?
	•	Comment le changement du port SSH par défaut améliore-t-il la sécurité ?