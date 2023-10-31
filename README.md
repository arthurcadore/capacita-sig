# Intelbras's SIG Application with Docker

### Author: Arthur Cadore M. Barcella
### Network Training Analyst at Intelbras

Prerequisites
Before you begin, ensure you have the following installed on your system:

- Git version 2.34.1
- Docker version 24.0.6, build ed223bc
- Docker Compose version v2.21.0

---

For Getting Started clone the repository:

Copy code below: 

```
git clone https://github.com/arthurcadore/capacita-sig
```
Navigate to the project directory:
```
cd ./capacita-sig
```

---

If you don't have Docker (and Docker-compose) installed on your system yet, it can be installed by run the following commands (Debian based images): 

```
chmod +x ./installDocker.sh

./installDocker.sh
```

Run the command below to start docker-compose file: 

```
docker compose -d up & 
```
The "-d" flag runs the containers in detached mode, meaning they will run in the background.

The "&" character creates a process id for the command inputed in, with means that the container will not stop when you close the terminal. 

---

Access the application:
Once the container is up and running, you can access the application at the http://127.0.0.1:8081, as defined in the docker-compose.yml file.

By default, the CLI access to the container is closed, so nobody can access it externally, only the application web Page. 

To access the application command line, first loggin into host device using SSH or another method, then use the command below: 

```
docker exec -it sig-capacita bash
```

The command above will start a bash process in the application container, that with the -it (interative) flag will display the prompt to user. 

To exit from container's command line interface, use the command `exit`.  

--- 

To stop the running container, use the following command:

```
docker-compose down
```

This command stops and removes the containers, networks, defined in the docker-compose.yml file.

