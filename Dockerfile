# ---- Étape 1 : build de l'application Angular ----
FROM node:20-alpine AS build
WORKDIR /app

# On copie d'abord les fichiers de dépendances pour profiter du cache Docker
COPY package*.json ./
RUN npm ci

# On copie le reste du code source et on lance le build de prod
COPY . .
RUN npm run build

# ---- Étape 2 : service statique via nginx ----
FROM nginx:1.27-alpine AS serve

# Remplace la config nginx par défaut par la nôtre (voir nginx.conf)
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Builder @angular-devkit/build-angular:browser → dist/<nom> (sans sous-dossier browser/)
COPY --from=build /app/dist/deadpool-squad /usr/share/nginx/html

EXPOSE 80
