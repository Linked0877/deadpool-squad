#!/bin/bash
# à exécuter avec : ./deploiement.sh

echo -n "Veuillez entrer votre mot de passe docker : "
read -s dockerPassword
echo

dockerUser="linked59"
imageName="linked59/deadpool-squad"

echo "Connexion à docker.io"
docker login -u $dockerUser -p $dockerPassword docker.io

VERSION=$(date +%Y%m%d%H%M)

echo "Build et push de l'image (version: $VERSION)"
echo "Plateforme cible : linux/amd64 (VPS Linux)"

docker buildx build --platform linux/amd64 --push \
  -t $imageName:$VERSION \
  -t $imageName:latest \
  .

echo "------------------"
echo "Image publiée : $imageName:$VERSION"
echo "Sur le VPS, exécuter :"
echo "  docker compose pull deadpool-squad && docker compose up -d --force-recreate deadpool-squad"
echo "Terminé"
