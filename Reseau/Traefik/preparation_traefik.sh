#!/bin/sh

echo "Création des dossiers..."

sudo mkdir -p /home/portainer/traefik/certs

echo "Création du fichier de configuration..."

cd /home/portainer/traefik
wget https://raw.githubusercontent.com/PortableStick/Homelab/refs/heads/main/Reseau/Traefik/traefik.yml

echo "Entrez l'e-mail du compte Cloudfare lié à la clé API : "

read email

sed -i "s/adressemail/$email/g" traefik.yml

echo "Réglage des permissions..."

touch /home/portainer/traefik/certs/acme.json
chmod -R 600 /home/portainer/traefik/

echo "Terminé !"
