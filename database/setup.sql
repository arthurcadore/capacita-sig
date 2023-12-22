-- Main composition file for PostgreSQL DB
-- Author: Arthur Cadore M. Barcella
-- Github: arthurcadore
-- Capacitação Redes - PV Intelbras


-- Create a new user with the password specified:
CREATE USER youruser WITH PASSWORD 'yourpassword';

-- Create database 'imn' with specified collation and owner
CREATE DATABASE imn LC_COLLATE='en_US.UTF8' LC_CTYPE='en_US.UTF8' TEMPLATE=template0;

-- Alter ownership of the 'imn' database to youruser:
ALTER DATABASE imn OWNER TO youruser;

-- Allow your user to connect from any host
ALTER USER youruser WITH SUPERUSER;

