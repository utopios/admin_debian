#!/bin/bash

# Script pour le Scénario 8 : Sauvegarde et Restauration des Bases de Données

# 1. Sauvegarde de la Base de Données de Gitea

# Création du script de sauvegarde
sudo tee /usr/local/bin/backup_gitea_db.sh > /dev/null << 'EOF'
#!/bin/bash

BACKUP_DIR="/var/backups/gitea_db"
DATE=$(date +'%Y-%m-%d_%H-%M-%S')
BACKUP_FILE="$BACKUP_DIR/gitea_db_backup_$DATE.tar.gz"

# Arrêter le service Gitea
echo "Arrêt du service Gitea..."
sudo systemctl stop gitea

# Vérifier que le répertoire de sauvegarde existe
sudo mkdir -p "$BACKUP_DIR"

# Sauvegarder le fichier de base de données SQLite
echo "Sauvegarde de la base de données..."
sudo tar -czf "$BACKUP_FILE" /var/lib/gitea/gitea.db

# Redémarrer le service Gitea
echo "Redémarrage du service Gitea..."
sudo systemctl start gitea

echo "Sauvegarde terminée : $BACKUP_FILE"
EOF

# Rendre le script exécutable
sudo chmod +x /usr/local/bin/backup_gitea_db.sh

# Planifier le script pour qu'il s'exécute chaque nuit à 3h du matin
sudo crontab -l > mycron
echo "0 3 * * * /usr/local/bin/backup_gitea_db.sh" >> mycron
sudo crontab mycron
rm mycron

echo "La sauvegarde de la base de données de Gitea est planifiée à 3h du matin chaque nuit."

# 2. Test de Restauration

echo "Pour tester la restauration, veuillez suivre les étapes décrites dans la documentation."
