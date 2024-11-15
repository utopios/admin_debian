#!/bin/bash

# Script pour le Scénario 5 : Gestion des Processus et Optimisation des Ressources

# 1. Surveillance des Processus

# Installation de htop si nécessaire
sudo apt update
sudo apt install -y htop

echo "Utilisez la commande 'htop' pour surveiller l'utilisation du CPU et de la mémoire."

# 2. Gestion des Processus

# a. Priorisation des processus
# Baisser la priorité (augmenter la valeur nice) d'Elasticsearch pour qu'il ait une priorité plus basse que Gitea

# Obtenir le PID du processus Elasticsearch
ES_PID=$(pgrep -f elasticsearch)

if [ -n "$ES_PID" ]; then
    echo "Modification de la priorité du processus Elasticsearch (PID: $ES_PID)..."
    sudo renice 10 -p $ES_PID
else
    echo "Elasticsearch n'est pas en cours d'exécution."
fi

# b. Gestion des signaux

# Créer un script pour gérer les services Gitea et Elasticsearch
cat << 'EOF' | sudo tee /usr/local/bin/manage_services.sh > /dev/null
#!/bin/bash

case "$1" in
    start)
        echo "Démarrage des services Gitea et Elasticsearch..."
        sudo systemctl start gitea
        sudo systemctl start elasticsearch
        ;;
    stop)
        echo "Arrêt des services Gitea et Elasticsearch..."
        sudo systemctl stop gitea
        sudo systemctl stop elasticsearch
        ;;
    restart)
        echo "Redémarrage des services Gitea et Elasticsearch..."
        sudo systemctl restart gitea
        sudo systemctl restart elasticsearch
        ;;
    *)
        echo "Usage: $0 {start|stop|restart}"
        exit 1
        ;;
esac
EOF

# Rendre le script exécutable
sudo chmod +x /usr/local/bin/manage_services.sh

echo "Le script '/usr/local/bin/manage_services.sh' a été créé pour gérer les services Gitea et Elasticsearch."

# c. Utilisation de bg et fg

echo "Pour utiliser bg et fg :
1. Lancez un processus en avant-plan (par exemple, 'top').
2. Suspendez-le avec Ctrl+Z.
3. Reprenez-le en arrière-plan avec 'bg'.
4. Ramenez-le en avant-plan avec 'fg'."
