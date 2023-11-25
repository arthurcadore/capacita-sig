script: 


service postgresql start
service rabbitmq-server start

su postgres

psql

 CREATE USER intelbras WITH PASSWORD 'intelbras';

 CREATE DATABASE imn LC_COLLATE='en_US.UTF8' LC_CTYPE='en_US.UTF8' template template0;
 ALTER DATABASE imn OWNER TO intelbras;


 \du
 \l

 \q

