#!/bin/bash

# Script pour le Scénario 7 : Gestion du Temps et Synchronisation NTP

# 1. Configuration du Fuseau Horaire

echo "Configuration du fuseau horaire sur Europe/Paris..."
sudo timedatectl set-timezone Europe/Paris

# Vérification du fuseau horaire
timedatectl

# 2. Mise en Place du Client NTP avec chrony

# Installation de chrony
sudo apt update
sudo apt install -y chrony

# Configuration de chrony pour utiliser les serveurs NTP de la région
sudo sed -i 's/^pool .*/pool fr.pool.ntp.org iburst/' /etc/chrony/chrony.conf

# Redémarrage du service chrony
sudo systemctl restart chrony

# Vérification de la synchronisation
echo "Vérification de la synchronisation NTP..."
chronyc sources -v
