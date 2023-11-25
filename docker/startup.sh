#!/bin/bash
# Author: Arthur Cadore M. Barcella
# Github: arthurcadore

# Start the PostgreSQL service in the background and print a message
echo "Author: Arthur Cadore M. Barcella"
echo "Github: arthurcadore"

echo "Configurando diretorio para mapeamento de volume"
chown -R postgres:postgres /var/lib/postgresql/9.5/main

echo "Iniciando o processo do postgresql"
service postgresql start & 

# Start the RabbitMQ server in the background and print a message
echo "Iniciando o RabbitMQ server"
service rabbitmq-server start & 

# Restart the RabbitMQ server in the background to ensure that RabbitMQ is running. 
echo "Reiniciando o RabbitMQ server"
service rabbitmq-server restart &

# Wait until the PostgreSQL database  becomes ready
while ! pg_isready -q -d imn -h 127.0.0.1 -U intelbras; do 
	echo "Aguardando o Banco de dados PostgreSQL iniciar..."
	sleep 1
done

# Start the core application using Java and print a message
echo "###########################################################"
echo "Iniciando a aplicação core"
exec /usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java -jar /usr/bin/imn/imn-core.jar &

# Start the web application using Java and print a message
echo "###########################################################"
echo "Iniciando a aplicação web"
exec /usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java -jar /usr/bin/imn/imn-webapp.jar &

# Keep the script running by tailing /dev/null
tail -f /dev/null
