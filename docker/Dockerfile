# Dockerfile: Defines container specifications to startup and run.
# Author: Arthur Cadore M. Barcella
# Github: arthurcadore
# Capacitação Redes - PV Intelbras

# Use the base image "arthurcadore/sig_intelbras:1.0.17.13"
FROM ubuntu:16.04

# Install SIG dependencies on container:
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -yq \
  -o Dpkg::Options::="--force-confdef" \
  -o Dpkg::Options::="--force-confold" \
  git \
  iputils-ping \
  iputils-tracepath \
  erlang \
  openjdk-8-jre:amd64 \
  openjdk-8-jre-headless:amd64 \
  postgresql-client-9.5 \
  postgresql-client-common \
  postgresql-contrib-9.5 \
  rabbitmq-server 

# Copy the "startup.sh" script from the local "./src/" directory to the container.
COPY docker/startup.sh /usr/local/bin/startup.sh

# Give executable permissions to the "startup.sh" script to execute.
RUN chmod +x /usr/local/bin/startup.sh

RUN mkdir -p /usr/bin/imn/config/

# Starts the container by running the startup.sh script.
CMD ["/usr/local/bin/startup.sh"]


