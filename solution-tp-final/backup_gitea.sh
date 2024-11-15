#!/bin/bash

# Répertoire de sauvegarde
BACKUP_DIR="/var/backups/gitea"
DATE=$(date +'%Y-%m-%d_%H-%M-%S')
BACKUP_FILE="$BACKUP_DIR/gitea_backup_$DATE.tar.gz"

# Arrêter le service Gitea
echo "Arrêt du service Gitea..."
systemctl stop gitea

# Vérifier que le répertoire de sauvegarde existe
mkdir -p "$BACKUP_DIR"

# Créer l'archive des données de Gitea
echo "Création de la sauvegarde..."
tar -czf "$BACKUP_FILE" /var/lib/gitea

# Redémarrer le service Gitea
echo "Redémarrage du service Gitea..."
systemctl start gitea

echo "Sauvegarde terminée : $BACKUP_FILE"