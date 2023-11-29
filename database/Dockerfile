# Dockerfile: Defines container specifications to startup and run.
# Author: Arthur Cadore M. Barcella
# Github: arthurcadore
# Capacitação Redes - PV Intelbras

# Use the official PostgreSQL image as base:
FROM postgres:9.5

# Copy custom initialization script to the container:
COPY database/setup.sql /docker-entrypoint-initdb.d/

