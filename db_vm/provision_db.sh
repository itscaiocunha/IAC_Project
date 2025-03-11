#!/bin/bash

echo "Instalando PostgreSQL..."
sudo apt-get update
sudo apt-get install -y postgresql postgresql-contrib

echo "Configurando o banco de dados..."
sudo -u postgres psql -c "CREATE DATABASE ist_data;"
sudo -u postgres psql -c "CREATE USER ist_user WITH PASSWORD 'senha123';"
sudo -u postgres psql -c "GRANT ALL PRIVILEGES ON DATABASE ist_data TO ist_user;"

echo "Importando dados para o banco..."
sudo -u postgres psql -d ist_data -c "\COPY registros FROM '/vagrant/dados_ist.csv' CSV HEADER;"
echo "Banco de dados configurado!"
