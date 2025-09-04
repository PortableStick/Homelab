#!/bin/sh

# Mise à jour de la liste des paquets
sudo apt-get update

# Installation des prérequis nécessaires
sudo apt-get install -y \
    ca-certificates \
    curl \
    gnupg

# Ajout de la clé GPG officielle de Docker
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
    sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# Configuration du dépôt Docker
echo \
  "deb [arch=$(dpkg --print-architecture) \
  signed-by=/etc/apt/keyrings/docker.gpg] \
  https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Mise à jour de la liste des paquets après ajout du dépôt
sudo apt-get update

# Installation du moteur Docker, de l’interface en ligne de commande et de containerd
sudo apt-get install -y docker-ce docker-ce-cli containerd.io

# Activation et démarrage du service Docker
sudo systemctl enable docker
sudo systemctl start docker

# Installation de Portainer via Docker
sudo docker volume create portainer_data
sudo docker run -d \
  -p 9000:9000 \
  --name=portainer \
  --restart=always \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v portainer_data:/data \
  portainer/portainer-ce:latest

echo "Préparation OK."