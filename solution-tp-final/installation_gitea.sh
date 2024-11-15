wget -O gitea https://dl.gitea.io/gitea/1.18.0/gitea-1.18.0-linux-amd64
chmod +x gitea
sudo mv gitea /usr/local/bin/
sudo adduser --system --shell /bin/bash --gecos 'Git Version Control' --group --disabled-password --home /home/git git
sudo mkdir -p /var/lib/gitea/{custom,data,log}
sudo chown -R git:git /var/lib/gitea/
sudo chmod -R 750 /var/lib/gitea/
#sudo nano /etc/systemd/system/gitea.service
sudo systemctl daemon-reload