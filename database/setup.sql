-- Create user 'intelbras' with password 'intelbras'
CREATE USER intelbras WITH PASSWORD 'intelbras';

-- Create database 'imn' with specified collation and owner
CREATE DATABASE imn LC_COLLATE='en_US.UTF8' LC_CTYPE='en_US.UTF8' TEMPLATE=template0;

-- Alter ownership of the 'imn' database to 'intelbras'
ALTER DATABASE imn OWNER TO intelbras;

-- Allow user 'intelbras' to connect from any host
ALTER USER intelbras WITH SUPERUSER;

