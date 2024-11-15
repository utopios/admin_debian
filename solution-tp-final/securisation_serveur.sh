ufw allow 2222/tcp
ufw allow 3000/tcp
ufw allow 80/tcp
ufw enable
sed -i 's/#Port 22/Port 2222/' /etc/ssh/sshd_config
sed -i 's/PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config
echo 'AllowUsers devadmin alice' >> /etc/ssh/sshd_config
systemctl restart ssh