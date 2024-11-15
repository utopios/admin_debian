# **TP Final : Administration Système sous Debian - Scénarios Réels**

## **Contexte Général :**

Vous travaillez en tant qu'administrateur système pour une entreprise nommée **TechCorp**, spécialisée dans le développement de solutions logicielles. Votre mission est de mettre en place et de gérer l'infrastructure serveur de l'entreprise en utilisant Debian. Vous devrez installer, configurer et sécuriser plusieurs services pour répondre aux besoins de l'entreprise, tout en respectant les bonnes pratiques d'administration système.

---

## **Scénario 1 : Mise en Place d'un Serveur de Développement**

### **Objectif :**

Installer et configurer un serveur Debian pour l'équipe de développement, comprenant un environnement de versionnement, de gestion de projets et des outils collaboratifs.

### **Tâches à Réaliser :**

1. **Installation Automatisée du Serveur :**

   - Préparez un fichier **Preseed** pour automatiser l'installation de Debian sur le serveur.
     - Le serveur doit avoir les paramètres suivants :
       - Nom d'hôte : `dev-server`.
       - Partitionnement automatique avec LVM :
         - `/` : 15 Go.
         - `/home` : 20 Go.
         - `/var` : 15 Go.
         - `swap` : Taille égale à la RAM.
     - Créez un utilisateur `devadmin` avec un mot de passe sécurisé.
     - Installez les paquets essentiels pour un serveur (sans interface graphique).

2. **Configuration Post-Installation :**

   - **Gestion des Utilisateurs et Groupes :**
     - Créez un groupe `developpeurs`.
     - Créez les utilisateurs suivants et ajoutez-les au groupe `developpeurs` :
       - `alice`, `bob`.
     - Configurez les environnements des utilisateurs pour qu'ils utilisent `bash` comme shell par défaut.

   - **Installation des Outils de Développement :**
     - Installez `git` pour le contrôle de version.
     - Installez `docker` pour la containerisation des applications.
     - Installez `nginx` comme serveur web pour héberger la documentation interne.

3. **Sécurisation du Serveur :**

   - **Configuration du Pare-feu :**
     - Utilisez `ufw` pour configurer le pare-feu.
     - Autorisez uniquement les ports nécessaires :
       - SSH (mais changez le port par défaut pour renforcer la sécurité).
       - HTTP (port 80) pour `nginx`.
       - Port spécifique pour `docker` si nécessaire.
     - Bloquez tout autre trafic entrant.

   - **Configuration du Service SSH :**
     - Désactivez l'accès root via SSH.
     - Limitez l'accès SSH aux utilisateurs `devadmin` et `alice`.
     - Mettez en place l'authentification par clés SSH pour `devadmin`.

4. **Mise en Place d'un Système de Gestion de Projets :**

   - Installez `Gitea` (une forge logicielle légère) pour héberger les dépôts `git` de l'équipe.
     - **Installation depuis une Archive :**
       - Téléchargez l'archive binaire de `Gitea`.
       - Configurez `Gitea` pour qu'il s'exécute en tant que service systemd.
     - **Configuration :**
       - Configurez `Gitea` pour qu'il utilise `sqlite` comme base de données.
       - Assurez-vous que le service démarre automatiquement au démarrage du serveur.
       - Vérifiez que `Gitea` est accessible via le navigateur web à l'adresse `http://dev-server`.

---

## **Scénario 2 : Gestion des Journaux et Surveillance du Système**

### **Objectif :**

Mettre en place une solution de gestion centralisée des journaux et de surveillance du système pour anticiper les problèmes et assurer la continuité du service.

### **Tâches à Réaliser :**

1. **Installation de la Stack ELK :**

   - **Ajout du Dépôt Elastic :**
     - Ajoutez le dépôt officiel d'Elastic pour Debian.
     - Mettez à jour la liste des paquets.

   - **Installation des Composants :**
     - Installez `Elasticsearch` pour le stockage et la recherche des journaux.
     - Installez `Logstash` pour le traitement des journaux.
     - Installez `Kibana` pour la visualisation des journaux.

2. **Configuration des Services :**

   - **Elasticsearch :**
     - Configurez `Elasticsearch` pour qu'il écoute uniquement sur `localhost` pour des raisons de sécurité.
     - Assurez-vous que le service démarre automatiquement.

   - **Logstash :**
     - Créez une configuration pour que `Logstash` collecte les journaux du système (`/var/log/syslog`).
     - Filtrez les logs pour extraire les informations pertinentes.

   - **Kibana :**
     - Configurez `Kibana` pour qu'il soit accessible uniquement depuis le réseau interne de l'entreprise.
     - Protégez l'accès à `Kibana` avec une authentification basique.

3. **Envoi des Journaux Système vers Logstash :**

   - Configurez `rsyslog` pour envoyer les journaux système à `Logstash`.
   - Assurez-vous que les journaux sont correctement indexés dans `Elasticsearch`.

4. **Surveillance du Système :**

   - Installez `Metricbeat` pour collecter les métriques du système (CPU, mémoire, disque).
     - Configurez `Metricbeat` pour envoyer les données à `Elasticsearch`.
   - Créez des tableaux de bord dans `Kibana` pour visualiser l'état du système en temps réel.

---

## **Scénario 3 : Planification et Automatisation des Tâches**

### **Objectif :**

Automatiser les tâches récurrentes et mettre en place des sauvegardes pour assurer la pérennité des données.

### **Tâches à Réaliser :**

1. **Planification de Tâches avec `cron` :**

   - **Sauvegarde des Données :**
     - Écrivez un script `backup_gitea.sh` qui :
       - Sauvegarde les dépôts `git` hébergés par `Gitea`.
       - Compresse la sauvegarde avec une date dans le nom du fichier.
       - Stocke la sauvegarde dans `/var/backups/gitea/`.
     - Planifiez le script pour qu'il s'exécute chaque nuit à 1h du matin.

   - **Nettoyage des Anciennes Sauvegardes :**
     - Écrivez un script `cleanup_backups.sh` qui :
       - Supprime les sauvegardes de plus de 7 jours.
     - Planifiez le script pour qu'il s'exécute chaque dimanche à 2h du matin.

2. **Automatisation avec `systemd` :**

   - Créez un service `systemd` pour le script de sauvegarde afin de pouvoir le lancer manuellement si nécessaire.
   - Créez un timer `systemd` pour remplacer la tâche `cron` si vous préférez centraliser la planification avec `systemd`.

---

## **Scénario 4 : Gestion des Droits et Sécurité**

### **Objectif :**

Assurer que les données sensibles sont protégées et que seuls les utilisateurs autorisés y ont accès.

### **Tâches à Réaliser :**

1. **Gestion des Permissions et ACL :**

   - **Répertoires de Projets :**
     - Créez un répertoire `/srv/projects`.
     - Attribuez le groupe `developpeurs` au répertoire.
     - Configurez les permissions pour que :
       - Les membres du groupe `developpeurs` puissent lire, écrire et exécuter.
       - Les autres utilisateurs n'aient aucun accès.

   - **ACL pour les Accès Spécifiques :**
     - Donnez à l'utilisateur `charlie` (qui n'est pas dans `developpeurs`) un accès en lecture seule à `/srv/projects`.
     - Vérifiez les permissions effectives pour chaque utilisateur.

2. **Sécurisation des Clés SSH :**

   - **Gestion des Clés SSH des Utilisateurs :**
     - Mettez en place une politique pour que les clés SSH des utilisateurs soient stockées de manière sécurisée.
     - Assurez-vous que les utilisateurs utilisent des phrases de passe pour protéger leurs clés privées.

---

## **Scénario 5 : Gestion des Processus et Optimisation des Ressources**

### **Objectif :**

Gérer efficacement les processus du serveur pour optimiser l'utilisation des ressources et assurer une haute disponibilité.

### **Tâches à Réaliser :**

1. **Surveillance des Processus :**

   - Utilisez `htop` pour surveiller l'utilisation du CPU et de la mémoire.
   - Identifiez les processus qui consomment le plus de ressources.

2. **Gestion des Processus :**

   - **Priorisation des Processus :**
     - Modifiez la priorité (`nice` value) des processus `Elasticsearch` pour qu'il ait une priorité plus basse que `Gitea`.
   - **Gestion des Signaux :**
     - Écrivez un script qui peut arrêter, démarrer ou redémarrer les services `Gitea` et `Elasticsearch` en envoyant les signaux appropriés.
   - **Utilisation de `bg` et `fg` :**
     - Lancez un processus en avant-plan, suspendez-le avec `Ctrl+Z`, puis reprenez-le en arrière-plan avec `bg`.
     - Ramenez le processus en avant-plan avec `fg` pour interagir avec lui.

---

## **Scénario 6 : Configuration Réseau Avancée**

### **Objectif :**

Configurer le réseau du serveur pour répondre aux besoins spécifiques de l'entreprise, y compris la gestion des interfaces réseau et la mise en place d'une interface virtuelle.

### **Tâches à Réaliser :**

1. **Configuration des Interfaces Réseau :**

   - **Interface Principale :**
     - Configurez l'interface réseau principale avec une adresse IP statique :
       - Adresse IP : `192.168.100.10`.
       - Masque de sous-réseau : `255.255.255.0`.
       - Passerelle par défaut : `192.168.100.1`.
       - Serveurs DNS : `8.8.8.8`, `8.8.4.4`.

   - **Interface Virtuelle :**
     - Créez une interface virtuelle `eth0:1` avec l'adresse IP `192.168.100.20`.
     - Configurez cette interface pour héberger un second service web.

2. **Configuration du Pare-feu Avancée :**

   - Utilisez `iptables` pour :
     - Rediriger le trafic entrant sur le port 8080 vers le port 80.
     - Limiter le nombre de connexions SSH simultanées pour prévenir les attaques.

---

## **Scénario 7 : Gestion du Temps et Synchronisation NTP**

### **Objectif :**

Assurer que le serveur a l'heure exacte pour la cohérence des journaux et des services sensibles au temps.

### **Tâches à Réaliser :**

1. **Configuration du Fuseau Horaire :**

   - Définissez le fuseau horaire sur `Europe/Paris`.

2. **Mise en Place du Client NTP :**

   - Installez `chrony` pour la synchronisation NTP.
   - Configurez `chrony` pour utiliser les serveurs NTP de votre région.
   - Vérifiez que le système est correctement synchronisé.

---

## **Scénario 8 : Sauvegarde et Restauration des Bases de Données**

### **Objectif :**

Mettre en place une stratégie de sauvegarde pour les bases de données utilisées par les services, afin de pouvoir les restaurer en cas de besoin.

### **Tâches à Réaliser :**

1. **Sauvegarde de la Base de Données de `Gitea` :**

   - Étant donné que `Gitea` utilise `sqlite`, créez un script qui :
     - Arrête temporairement le service `Gitea` pour éviter les écritures pendant la sauvegarde.
     - Copie le fichier de base de données vers un répertoire de sauvegarde.
     - Redémarre le service `Gitea`.
   - Planifiez ce script pour qu'il s'exécute chaque nuit à 3h du matin.

2. **Test de Restauration :**

   - Simulez une restauration de la base de données sur un environnement de test pour vérifier l'intégrité de la sauvegarde.

---

## **Livrables Attendus :**

- **Rapport Détaillé :**
  - Présentez chaque scénario avec les tâches réalisées.
  - Pour chaque tâche, listez les actions entreprises sans inclure les commandes exactes ou les configurations détaillées.
  - Expliquez les choix effectués et les bonnes pratiques suivies.
  - Mentionnez les défis rencontrés et comment vous les avez abordés.

- **Documentation des Services :**
  - Fournissez une documentation pour l'équipe de développement sur l'utilisation des services mis en place (par exemple, comment accéder à `Gitea`, où trouver les journaux, etc.).
