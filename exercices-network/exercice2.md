### Exercice : Synchronisation de l’heure avec chrony

**Objectif** :

Configurer le client NTP en utilisant chrony pour assurer une synchronisation précise de l’heure sur votre système Debian 12.

**Instructions** :
	1.	Tâches à réaliser :
a. Installez le paquet chrony.
b. Modifiez le fichier de configuration /etc/chrony/chrony.conf pour utiliser les serveurs NTP suivants :
	•	time.google.com
	•	time1.facebook.com
c. Redémarrez le service chrony pour appliquer les changements.
d. Vérifiez que le système est synchronisé avec les serveurs NTP configurés.
	2.	Vérifications :
	•	Utilisez chronyc tracking pour vérifier le statut de la synchronisation.
	•	Utilisez chronyc sources -v pour afficher les sources NTP et leur état.
	3.	Questions de réflexion :
	•	Pourquoi est-il important de synchroniser l’heure sur un serveur ?
	•	Quels problèmes peuvent survenir si un serveur a une horloge non synchronisée ?