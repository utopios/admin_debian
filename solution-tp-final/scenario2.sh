#!/bin/bash

# Vérification que le script est exécuté en tant que root
if [ "$(id -u)" != "0" ]; then
   echo "Ce script doit être exécuté en tant que root" 1>&2
   exit 1
fi

echo "Mise à jour du système..."
apt update && apt upgrade -y

# 1. Installation de la Stack ELK

echo "Importation de la clé GPG d'Elastic..."
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | apt-key add -

echo "Ajout du dépôt Elastic..."
apt install -y apt-transport-https
echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | tee /etc/apt/sources.list.d/elastic-7.x.list

echo "Mise à jour de la liste des paquets..."
apt update

echo "Installation d'Elasticsearch..."
apt install -y elasticsearch

echo "Installation de Logstash..."
apt install -y logstash

echo "Installation de Kibana..."
apt install -y kibana

# 2. Configuration des Services

## Elasticsearch

echo "Configuration d'Elasticsearch pour écouter sur localhost..."
sed -i 's/#network.host: .*/network.host: localhost/' /etc/elasticsearch/elasticsearch.yml

echo "Activation et démarrage d'Elasticsearch..."
systemctl daemon-reload
systemctl enable elasticsearch
systemctl start elasticsearch

## Logstash

echo "Création de la configuration Logstash pour collecter les journaux système..."
cat > /etc/logstash/conf.d/syslog.conf << EOF
input {
  file {
    path => "/var/log/syslog"
    type => "syslog"
    start_position => "beginning"
  }
}

filter {
  if [type] == "syslog" {
    grok {
      match => { "message" => "%{SYSLOGLINE}" }
    }
    date {
      match => [ "timestamp", "MMM  d HH:mm:ss", "MMM dd HH:mm:ss" ]
    }
  }
}

output {
  elasticsearch {
    hosts => ["localhost:9200"]
    index => "syslog-%{+YYYY.MM.dd}"
  }
}
EOF

echo "Activation et démarrage de Logstash..."
systemctl enable logstash
systemctl start logstash

## Kibana

echo "Configuration de Kibana pour écouter sur localhost..."
sed -i 's/#server.host: .*/server.host: "localhost"/' /etc/kibana/kibana.yml

echo "Activation et démarrage de Kibana..."
systemctl enable kibana
systemctl start kibana

# 3. Envoi des Journaux Système vers Logstash

echo "Configuration de rsyslog pour envoyer les journaux à Logstash..."
echo "*.* @@localhost:514" >> /etc/rsyslog.d/10-logstash.conf

echo "Redémarrage de rsyslog..."
systemctl restart rsyslog

# 4. Surveillance du Système avec Metricbeat

echo "Installation de Metricbeat..."
apt install -y metricbeat

echo "Configuration de Metricbeat pour envoyer les données à Elasticsearch..."

# Activer les modules système
metricbeat modules enable system

# Charger les configurations par défaut dans Elasticsearch
metricbeat setup -e

# Démarrer et activer Metricbeat
systemctl enable metricbeat
systemctl start metricbeat

echo "Installation et configuration terminées."

echo "Vous pouvez accéder à Kibana à l'adresse http://localhost:5601"