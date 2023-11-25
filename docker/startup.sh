#!/bin/bash
# Author: Arthur Cadore M. Barcella
# Github: arthurcadore

# Start the PostgreSQL service in the background and print a message
echo "Author: Arthur Cadore M. Barcella"
echo "Github: arthurcadore"

echo "Configurando diretorio para mapeamento de volume"
chown -R postgres:postgres /var/lib/postgresql/9.5/main

echo "Iniciando o processo do postgresql"
service postgresql start

# Start the RabbitMQ server in the background and print a message
echo "Iniciando o RabbitMQ server"
service rabbitmq-server start

# Restart the RabbitMQ server in the background to ensure that RabbitMQ is running.
echo "Reiniciando o RabbitMQ server"
service rabbitmq-server restart

# Use psql to execute SQL commands
sleep 10
echo "Criando usuário intelbras e banco de dados imn"
sudo -u postgres psql -c "CREATE USER intelbras WITH PASSWORD 'intelbras';"
sudo -u postgres psql -c "CREATE DATABASE imn LC_COLLATE='en_US.UTF8' LC_CTYPE='en_US.UTF8' TEMPLATE=template0;"
sudo -u postgres psql -c "ALTER DATABASE imn OWNER TO intelbras;"

# Exibir usuários e bancos para verificar
echo "Usuários no PostgreSQL:"
sudo -u postgres psql -c "\du"

echo "Bancos de dados no PostgreSQL:"
sudo -u postgres psql -c "\l"

# Wait until the PostgreSQL database becomes ready
# while ! pg_isready -q -d imn -h 127.0.0.1 -U intelbras; do
# 	echo "Aguardando o Banco de dados PostgreSQL iniciar..."
# 	sleep 1
#done

# Start the core application using Java and print a message
echo "###########################################################"
echo "Iniciando a aplicação SIG Legado"
exec java -jar /project/imn-core.jar && java -jar /project/imn-webapp.jar &