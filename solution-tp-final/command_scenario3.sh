sudo chmod +x /usr/local/bin/cleanup_backups.sh
sudo crontab -e
0 1 * * * /usr/local/bin/backup_gitea.sh
0 2 * * 0 /usr/local/bin/cleanup_backups.sh

sudo systemctl enable backup_gitea.timer
sudo systemctl start backup_gitea.timer

sudo systemctl enable cleanup_backups.timer
sudo systemctl start cleanup_backups.timer

systemctl list-timers