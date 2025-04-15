# Utilise une image Nginx légère
FROM nginx:alpine

# Copie ton site dans le dossier web de nginx
COPY . /usr/share/nginx/html

# Expose le port 80 (serveur web)
EXPOSE 80
