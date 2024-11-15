groupadd developpeurs
useradd -m -s /bin/bash -G developpeurs alice
echo "alice:password" | chpasswd
useradd -m -s /bin/bash -G developpeurs bob
echo "bob:password" | chpasswd
useradd -m -s /bin/bash -G developpeurs charlie
echo "charlie:password" | chpasswd
apt-get install -y git docker.io nginx
systemctl start nginx
systemctl enable nginx