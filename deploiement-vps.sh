#!/bin/bash
# À placer dans le même dossier que ton docker-compose.yml sur le VPS
# Exécuter avec : ./deploiement-vps.sh

set -e  # arrête le script à la première erreur

echo "Pull de la dernière image depuis Docker Hub..."
docker compose pull deadpool-squad

echo "Redémarrage du service..."
docker compose up -d --force-recreate deadpool-squad

echo "Terminé. Statut du conteneur :"
docker compose ps deadpool-squad
