#!/bin/sh

echo "Création des dossiers..."

sudo mkdir -r ~/traefik/certs

echo "Création du fichier de configuration..."

cd ~/traefik
wget https://raw.githubusercontent.com/PortableStick/Homelab/refs/heads/main/Reseau/Traefik/traefik.yml

echo "Entrez l'e-mail du compte Cloudfare lié à la clé API : "

read email

sed -i 's/[EMAIL]/$email/' traefik.yml

echo "Terminé !"
