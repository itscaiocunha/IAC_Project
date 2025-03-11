#!/bin/bash

echo "Instalando Node.js e dependências..."
sudo apt-get update
sudo apt-get install -y nodejs npm

echo "Criando microserviço..."
mkdir /vagrant/microservice
cd /vagrant/microservice
npm init -y
npm install express pg

echo "Configurando microserviço..."
cat <<EOF > /vagrant/microservice/app.js
const express = require('express');
const { Pool } = require('pg');
const app = express();
const port = 3000;

const pool = new Pool({
    user: 'ist_user',
    host: '192.168.56.20',
    database: 'ist_data',
    password: 'senha123',
    port: 5432,
});

app.get('/dados', async (req, res) => {
    try {
        const result = await pool.query('SELECT * FROM registros LIMIT 10;');
        res.json(result.rows);
    } catch (err) {
        res.status(500).send(err.message);
    }
});

app.listen(port, () => {
    console.log(\`Microserviço rodando na porta \${port}\`);
});
EOF

echo "Executando microserviço..."
node /vagrant/microservice/app.js &
