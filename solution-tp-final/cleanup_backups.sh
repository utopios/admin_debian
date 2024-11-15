#!/bin/bash

# Répertoire de sauvegarde
BACKUP_DIR="/var/backups/gitea"

# Supprimer les fichiers de plus de 7 jours
echo "Suppression des sauvegardes de plus de 7 jours..."
find "$BACKUP_DIR" -type f -name "gitea_backup_*.tar.gz" -mtime +7 -exec rm -f {} \;

echo "Nettoyage terminé."