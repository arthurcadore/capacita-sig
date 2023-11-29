#!/bin/bash
# Author: Arthur Cadore M. Barcella
# Github: arthurcadore

# Start the PostgreSQL service in the background and print a message
echo "Author: Arthur Cadore M. Barcella"
echo "Github: arthurcadore"

# Start the RabbitMQ server in the background and print a message
echo "Iniciando o RabbitMQ server"
service rabbitmq-server start

# Restart the RabbitMQ server in the background to ensure that RabbitMQ is running.
echo "Reiniciando o RabbitMQ server"
service rabbitmq-server restart

# Wait until the PostgreSQL database becomes ready
while ! pg_isready -q -d imn -h database -U intelbras; do
  echo "Aguardando o Banco de dados PostgreSQL iniciar..."
  sleep 1
done

echo "Usuários no PostgreSQL:"
PGPASSWORD=intelbras psql -h database -U intelbras -d imn -c "\du"

echo "Bancos de dados no PostgreSQL:"
PGPASSWORD=intelbras psql -h database -U intelbras -d imn -c "\l"

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
