#!/bin/bash

# Script pour le Scénario 6 : Configuration Réseau Avancée

# 1. Configuration des Interfaces Réseau

# a. Configuration de l'interface principale avec une adresse IP statique

# Sauvegarde du fichier interfaces existant
sudo cp /etc/network/interfaces /etc/network/interfaces.bak

# Configuration de l'interface eth0
cat << EOF | sudo tee /etc/network/interfaces > /dev/null
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.168.100.10
    netmask 255.255.255.0
    gateway 192.168.100.1
    dns-nameservers 8.8.8.8 8.8.4.4

auto eth0:1
iface eth0:1 inet static
    address 192.168.100.20
    netmask 255.255.255.0
EOF

# Redémarrage du service réseau
echo "Redémarrage du service réseau..."
sudo systemctl restart networking

# b. Interface virtuelle eth0:1 est configurée dans le fichier ci-dessus

# 2. Configuration du Pare-feu Avancée

# a. Redirection du trafic entrant sur le port 8080 vers le port 80
sudo iptables -t nat -A PREROUTING -p tcp --dport 8080 -j REDIRECT --to-port 80

# b. Limitation du nombre de connexions SSH simultanées
# Supposons que le port SSH est 22
sudo iptables -A INPUT -p tcp --syn --dport 2222 -m connlimit --connlimit-above 3 -j REJECT

# Sauvegarder les règles iptables pour qu'elles persistent après un redémarrage
sudo apt install -y iptables-persistent
sudo netfilter-persistent save

echo "La configuration réseau avancée a été appliquée."
