#!/bin/bash

# Script de génération des certificats SSL auto-signés pour qBittorrent
# Usage: bash generate-ssl.sh

set -e

echo "========================================="
echo "Génération des certificats SSL qBittorrent"
echo "========================================="

# Configuration
SSL_DIR="/home/portainer/qbittorrent/ssl"
CERT_FILE="$SSL_DIR/qbittorrent.crt"
KEY_FILE="$SSL_DIR/qbittorrent.key"
PUID=${PUID:-1000}
PGID=${PGID:-1000}

# Créer le dossier SSL s'il n'existe pas
echo "Création du dossier SSL..."
mkdir -p "$SSL_DIR"

# Générer le certificat auto-signé (valide 365 jours)
echo "Génération du certificat auto-signé (valide 365 jours)..."
openssl req -x509 -newkey rsa:4096 -nodes \
  -out "$CERT_FILE" \
  -keyout "$KEY_FILE" \
  -days 365 \
  -subj "/C=FR/ST=France/L=Paris/O=Homelab/CN=qbittorrent.local"

# Définir les bonnes permissions
echo "Configuration des permissions..."
chown -R ${PUID}:${PGID} "$SSL_DIR"
chmod 600 "$KEY_FILE"
chmod 644 "$CERT_FILE"

echo ""
echo "========================================="
echo "Certificats SSL générés avec succès !"
echo "========================================="
echo "Certificat : $CERT_FILE"
echo "Clé privée : $KEY_FILE"
echo "Validité   : 365 jours"
echo "========================================="
