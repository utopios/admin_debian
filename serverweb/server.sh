#!/bin/bash


if command_exists node; then
    echo "Node.js est déjà installé."
else
    echo "Node.js n'est pas installé. Installation en cours..."
    sudo apt update
    sudo apt install -y curl
    curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
    sudo apt install -y nodejs
fi

# Vérifier l'installation de Node.js
node_version=$(node -v)
npm_version=$(npm -v)
echo "Node.js version: $node_version"
echo "npm version: $npm_version"

npm init -y

npm install express

node server.js &
server_pid=$!
echo "Serveur démarré avec PID: $server_pid"

echo $server_pid > server_pid.txt

echo "Le serveur est accessible à l'adresse http://localhost"