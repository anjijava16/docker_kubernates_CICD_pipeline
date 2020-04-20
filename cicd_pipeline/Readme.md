## CICD setup

# JDK  Setup 1.8
sudo apt-get remove java-1.7*

export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
export PATH=$CONFLUENT_HOME/bin:$HADOOP_HOME/bin:$HADOOP_HOME/sbin:$JAVA_HOME/bin:$PATH


#Maven Setup :
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
export HADOOP_HOME=/home/welcome/work_inst/hadoop-2.8.5
export M2_HOME=/usr/share/maven
export CONFLUENT_HOME=/home/welcome/work_inst/confluent-5.4.1-2.12/confluent-5.4.1
export PATH=$M2_HOME/bin:$CONFLUENT_HOME/bin:$HADOOP_HOME/bin:$HADOOP_HOME/sbin:$JAVA_HOME/bin:$PATH



# Git Setup
yum install git -y

sudo apt-get git -y

# Jenkins Setup 
wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update
sudo apt-get install jenkins
sudo systemctl start jenkins
sudo systemctl status jenkins
sudo  /var/lib/jenkins/secrets/initialAdminPassword
#URL 
   http://localhost:8080/
   welcome
  *** XXXXYSXMaxis@123473488
   
   # Jenkins required Plugin 
      1. Maven Invoker and Maven Integration (Maven Projects)
      1.Deploy to container (Deploy into the Linux Servers)
      2. Publish Over SSH	  (Jenkins to Docker communicaion)
   #Jenkins Location ::   
     # /var/lib/jenkins/workspace
   
   
  # Adding New user for Docker Jenkins Integration"
			useradd dockeradmin
			passwd dockeradmin
             (Ubuntu)
			 sudo adduser dockeradmin
			 
			 Login :
			  su dockeradmin 

			  
 sudo deluser dockeradmin
 sudo adduser dockeradmin
 sudo usermod -aG sudo dockeradmin
# IMp to change ssh_config 
sudo vi /etc/ssh/ssh_config 
StrickHostKeyChecking no 

sudo service ssh restart 

sudo su jenkins 
 # Add Jenkins Level :
  Manage Jenkins ====>> Configure System =====>> Publish Over SSH ====>  
			  
 # Install Tomcat Server :
   wget https://downloads.apache.org/tomcat/tomcat-8/v8.5.53/bin/apache-tomcat-8.5.53.tar.gz
  cd /opt/ 
  
   tar -xvzf /opt/apache-tomcat-8.5.35.tar.gz
   
   
FROM tomcat:latest
MAINTAINER ANJI
COPY ./webapp.jar /usr/local/tomcat/webapps/

docker build -t devops-project .
   
 # Install Docker 
   docker images ls 
   docker ps -a 
   docker info
   docker info 

# Docker Tomcat   
  
 docker pull tomcat:latest
 docker run -d --name tomcat-container -p 8181:8080 tomcat
 
# Docker Login Inside the exec Command ::
 
 docker exec -it tomcat-container /bib/bash 
 Login Docker inside above command 
     5  cd webapps.dist/
    6  cp -R * ../webapps/
    7  history


docker image pull tomcat:8.0-alpine
docker container run -d -p 7070:8080 tomcat:8.0-alpine

   
   
   
