# 3-curl.dockerfile
# Utiliser une image légère de base
FROM alpine:latest

# Installer curl
RUN apk add --no-cache curl

# Créer un utilisateur non-root
RUN adduser -D appuser

# Changer d'utilisateur
USER appuser

# Définir le point d'entrée sur la commande curl
ENTRYPOINT ["curl"]

# Permettre de passer des arguments à curl (par ex: une URL)
CMD ["--help"]
