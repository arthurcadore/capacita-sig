# Dockerfile: Defines container specifications to startup and run.   
# Author: Arthur Cadore M. Barcella
# Github: arthurcadore
# Capacitação Redes - PV Intelbras

# Use the base image "arthurcadore/sig_intelbras:1.0.17.13"
FROM arthurcadore/sig_intelbras:1.0.17.13

# Copy the "startup.sh" script from the local "./src/" directory to the container.
COPY ./src/startup.sh /home/startup.sh

# Give executable permissions to the "startup.sh" script to execute. 
RUN chmod +x /home/startup.sh

# Starts the container by running the startup.sh script. 
CMD ["/home/startup.sh"]
