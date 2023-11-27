# Use the official PostgreSQL image as base
FROM postgres:9.5

# Copy custom initialization script to the container
COPY database/setup.sql /docker-entrypoint-initdb.d/

# Expose the PostgreSQL port
EXPOSE 5432

