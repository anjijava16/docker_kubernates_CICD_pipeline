# DockerSetup 

# Docker Insall on Ubuntu 

sudo apt-get remove docker docker-engine docker.io containerd runc

sudo apt-get update

sudo apt-get install     apt-transport-https     ca-certificates     curl     gnupg-agent     software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo apt-key fingerprint 0EBFCD88

sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io

# Docker Version

docker -v


# Docker Test (After install the above commands)
sudo docker run hello-world



docker pull anjaiahspr/docker-airflow

docker run -d -p 8080:8080 anjaiahspr/docker-airflow

 docker run -d -p 8080:8080 -v /home/welcome/Desktop/imp/Airflow/:/usr/local/airflow/dags/ anjaiahspr/docker-airflow





docker pull puckel/docker-airflow

Note if any issues : sudo chmod 666 /var/run/docker.sock


docker images

docker run -d -p 8080:8080 puckel/docker-airflow webserver

docker ps 
docker exec -ti 22943c145085 bash



e30f8fef512d
docker exec -ti e30f8fef512d bash
docker pull anjaiahspr/docker-airflow

docker run -d -p 8080:8080 anjaiahspr/docker-airflow

 docker run -d -p 8080:8080 -v /home/welcome/Desktop/imp/Airflow/:/usr/local/airflow/dags/ anjaiahspr/docker-airflow
 
 
docker exec -ti 4f1170d49d7e bash

Here docker is running :
 /usr/local/airflow/dags
 
 https://www.mikulskibartosz.name/how-to-run-airflow-in-docker/
 
 
 docker run -d -p 8080:8080 -e AIRFLOW__CORE__SQL_ALCHEMY_CONN=sqlite:////usr/local/airflow/db/airflow.db -v /home/user/airflow/dags:/usr/local/airflow/dags -v /home/user/airflow/db:/usr/local/airflow/db puckel/docker-airflow webserver
 
 
 docker run -d -p 8080:8080 -v /home/welcome/Desktop/imp/Airflow/: /usr/local/airflow/dags/ puckel/docker-airflow webserver
 
 docker run -d -p 8080:8080 -v /home/welcome/Desktop/imp/Airflow/:/usr/local/airflow/dags/ puckel/docker-airflow webserver
 
 
 
 docker run -d -p 8080:8080 -v /path/to/dags/on/your/local/machine/:puckel/docker-airflow webserver
 
 docker run -d -p 8080:8080 -v /path/to/dags/on/your/local/machine/:/usr/local/airflow/dags  puckel/docker-airflow webserver

docker run -d -p 8080:8080 -v /home/welcome/Desktop/imp/Airflow/:/usr/local/airflow/dags  puckel/docker-airflow webserver


# Docker Hub Creation 
  https://hub.docker.com/r/anjaiahspr/welcomedocker/  : 
  docker pull anjaiahspr/welcomedocker


# Docker Hub Exmple-2 
     https://hub.docker.com/r/anjaiahspr/java-app/ 
     docker pull anjaiahspr/java-app
