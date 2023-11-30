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

# Create Locale UFT-8 to configure database tables
echo "Configurando Locales para codificar o banco de dados:"
locale-gen en_US.UTF-8

# Use psql to execute SQL commands
sleep 10
echo "Criando usuário intelbras e banco de dados imn..."
su - postgres -c "psql -c 'CREATE USER intelbras WITH PASSWORD '\''intelbras'\'';'"
su - postgres -c "psql -c 'CREATE DATABASE imn LC_COLLATE='\''en_US.UTF8'\'' LC_CTYPE='\''en_US.UTF8'\'' TEMPLATE=template0;'"
su - postgres -c "psql -c 'ALTER DATABASE imn OWNER TO intelbras;'"

# Exibir usuários e bancos para verificar
echo "Usuários no PostgreSQL:"
su - postgres -c "psql -c '\du'"

echo "Bancos de dados no PostgreSQL:"
su - postgres -c "psql -c '\l'"

echo "Verificando e matando processos nas portas 8080 e 8081..."
lsof -i :8080 -i :8081 | awk 'NR!=1 {print $2}' | xargs -r kill -9

# Start the core application using Java and print a message
echo "###########################################################"
echo "Iniciando a aplicação core"
exec /usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java -jar /project/imn-core.jar &

# Start the web application using Java and print a message
echo "###########################################################"
echo "Iniciando a aplicação web"
exec /usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java -jar /project/imn-webapp.jar &

# Keep the script running by tailing /dev/null
tail -f /dev/null
