sudo mkdir -p /srv/projects
sudo chown root:developpeurs /srv/projects
sudo chmod 770 /srv/projects
sudo chmod g+s /srv/projects
sudo apt install -y acl
sudo setfacl -m u:charlie:rx /srv/projects
getfacl /srv/projects

su - alice
cd /srv/projects
touch test_alice.txt


su - charlie
ls /srv/projects
cat /srv/projects/test_alice.txt

touch /srv/projects/test_charlie.txt

chmod 700 ~/.ssh
chmod 600 ~/.ssh/id_rsa

ssh-keygen -t rsa -b 4096 -C "email@example.com"


for user in alice bob charlie; do
    sudo -u $user ls -ld /home/$user/.ssh
    sudo -u $user ls -l /home/$user/.ssh
done