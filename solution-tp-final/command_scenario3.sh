sudo chmod +x /usr/local/bin/cleanup_backups.sh
sudo crontab -e
0 1 * * * /usr/local/bin/backup_gitea.sh
0 2 * * 0 /usr/local/bin/cleanup_backups.sh