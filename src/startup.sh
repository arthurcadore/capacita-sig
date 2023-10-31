#!/bin/bash

sleep 2
echo "Iniciando o processo do postgresql"
service postgresql start & 
sleep 2 
echo "Reiniciando o processo do postgresql"
service postgresql restart & 
sleep 2

echo "Iniciando o RabbitMQ server"
service rabbitmq-server start & 
sleep 2

echo "Reiniciando o RabbitMQ server"
service rabbitmq-server restart &
sleep 2

while ! pg_isready -q -d imn -h 127.0.0.1 -U intelbras; do 
	echo "Aguardando o PostgreSQL iniciar..."
	sleep 1
done


echo "Iniciando a aplicação core"
exec /usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java -jar /usr/bin/imn/imn-core.jar &

echo "Iniciando a aplicação web"
exec /usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java -jar /usr/bin/imn/imn-webapp.jar &

sleep 2
# Manter o script em execução
tail -f /dev/null
