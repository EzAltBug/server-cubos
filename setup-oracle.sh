#!/bin/bash
set -e

echo "=== Instalando Docker ==="
curl -fsSL https://get.docker.com | sh
sudo usermod -aG docker $USER
newgrp docker

echo "=== Clonando repositorio ==="
git clone https://github.com/EzAltBug/server-cubos.git
cd server-cubos

echo "=== Abriendo puerto 25565 en firewall ==="
sudo iptables -I INPUT -p tcp --dport 25565 -j ACCEPT
sudo iptables -I INPUT -p udp --dport 25565 -j ACCEPT
sudo netfilter-persistent save

echo "=== Iniciando servidor ==="
docker compose up -d

echo ""
echo "Servidor iniciando. Ver logs con:"
echo "  cd server-cubos && docker compose logs -f"
