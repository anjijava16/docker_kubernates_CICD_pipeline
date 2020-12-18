# GIT Setup 
		sudo apt install git
 
 
# JDK 
		sudo apt-get install openjdk-8-jdk
		java -version 

# Maven 
		sudo apt install maven
		mvn -version


# docker  
		sudo apt update
		sudo apt install apt-transport-https ca-certificates curl software-properties-common

			curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
			sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
			apt-cache policy docker-ce
			sudo apt install docker-ce
			docker -v 
		Issue with ubunutu useer :Got permission denied while trying to connect to the Docker daemon socket at unix:///var/run/docker.sock
		Link: https://stackoverflow.com/questions/47854463/docker-got-permission-denied-while-trying-to-connect-to-the-docker-daemon-socke
		sudo usermod -a -G docker ubuntu
		newgrp docker

		You can do:
		sudo usermod -a -G docker ubuntu
		newgrp docker

		or whatever your username is.
		You can check it at the end doing grep docker /etc/group and see something like this:
		docker:x:998:alice
		in one of the lines.
		Then change your users group ID to docker:
		sudo usermod -a -G docker ubuntu
		

# MYSQL Setup 

		docker run --detach --env MYSQL_ROOT_PASSWORD=dummypassword --env MYSQL_USER=todos-user --env MYSQL_PASSWORD=dummytodos --env MYSQL_DATABASE=todos --name mysql --publish 3306:3306 mysql:5.7
		docker container run -p 8080:8080 --link=mysql -e RDS_HOSTNAME=mysql  anjaiahspr/todo-web-application-mysql:0.0.1-SNAPSHOT


# Custom Network
		docker network ls
		docker network create web-application-mysql-network
		docker inspect web-application-mysql-network

# Using Custom Network
		docker run --detach --env MYSQL_ROOT_PASSWORD=dummypassword --env MYSQL_USER=todos-user --env MYSQL_PASSWORD=dummytodos --env MYSQL_DATABASE=todos --name mysql --publish 3306:3306 --network=web-application-mysql-network mysql:5.7


# Custom Network
		APP Server Using Custom Network 
		docker container run -p 8080:8080 --network=web-application-mysql-network -e RDS_HOSTNAME=mysql  anjaiahspr/todo-web-application-mysql:0.0.1-SNAPSHOT

# Create tag 
		docker tag anjaiahspr/todo-web-application-mysql:0.0.1-SNAPSHOT anjaiahspr/todo-web-application-mysql:0.0.1-SNAPSHOT

# Create Version Tag:
		docker tag anjaiahspr/rest-api-full-stack:0.0.1-SNAPSHOT anjaiahspr/rest-api-full-stack:1.0-Release
		docker push anjaiahspr/rest-api-full-stack:1.0-Release


# Volume 
		docker run --detach --env MYSQL_ROOT_PASSWORD=dummypassword --env MYSQL_USER=todos-user --env MYSQL_PASSWORD=dummytodos --env MYSQL_DATABASE=todos --name mysql --publish 3306:3306 --network=web-application-mysql-network --volume mysql-database-volume:/var/lib/mysql  mysql:5.7


# PUSH 
		docker push anjaiahspr/todo-web-application-mysql:0.0.1-SNAPSHOT
		docker create volume data 
		docker run -it --name=example1 --mount source=data,destination=/data ubuntu
		docker volume inspect data
				  [
					{
						"CreatedAt": "2020-12-17T17:33:12Z",
						"Driver": "local",
						"Labels": {},
						"Mountpoint": "/var/lib/docker/volumes/data/_data",
						"Name": "data",
						"Options": {},
						"Scope": "local"
					}
				]


#	Moutn the Docker volume to host name 
		docker run -v /home/ubuntu/data:/var/lib/docker/volumes/data
		
# Clean Up process :
		   docker system prune
		  # Remove allimages 
		  docker rmi $(docker images -a -q)
		  # Force Delete
		  docker rmi -f $(docker images -a -q)
		  # Cross Check all containers and images deleted
			docker ps -a
			docker images -a
			
		docker stop $(docker ps -a -q)
		docker rm $(docker ps -a -q)



## FULL STAK Project 
		ubuntu@ec2-3-235-177-5.compute-1.amazonaws.com

		docker Image BUILD :using maven clean package -DskipTests
		RUN: docker run -p 8080:8080 anjaiahspr/rest-api-full-stack:0.0.1-SNAPSHOT
		Backend URL POST : http://ec2-3-235-177-5.compute-1.amazonaws.com:8080/authenticate  
		{
			"token": "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJpbjI4bWludXRlcyIsImV4cCI6MTYwODg0OTQxNCwiaWF0IjoxNjA4MjQ0NjE0fQ.BRLVxQDTnhmpLjTFCj3DYHIk9f1v4plT2921TZjJ5sqCSIpaX1oAWFXqiFWcydq61QQ0BExhzKnOVC02mZ0qHA"
		}

		  
		cd C:\Tech_Learn_welcome\sai_workspace_utils\Java\docker_workspace\docker-crash-course-master\04-spring-boot-react-full-stack-h2\frontend\todo-app

		docker build .  

		docker build . -t anjaiahspr/todo-front-end:0.0.1-SNAPSHOT

		docker run -d -p 4200:80 anjaiahspr/todo-front-end:0.0.1-SNAPSHOT
		Front End URL:  http://localhost:4200/ 
		Front End URL: http://ec2-3-235-177-5.compute-1.amazonaws.com:4200



# rest-api-full-stack Build 
		Removing intermediate container 5b235585ad41
		 ---> 10d98096e30f
		Successfully built 10d98096e30f




## docker compose 

		docker-compose scale : deprected 

		docker-compose up -d --scale servicename=3

		sudo apt  install docker-compose

			image: in28min/todo-front-end:0.0.1-SNAPSHOT

			(OR) 
				#build:
				  #context: frontend/todo-app
				  #dockerfile: Dockerfile

		Step both container should have images :
		anjaiahspr/todo-front-end:0.0.1-SNAPSHOT
		anjaiahspr/rest-api-full-stack:0.0.1-SNAPSHOT


		Step 2:
		docker network create fullstack-application-network


			hash docker-compose
			docker-compose events
			docker-compose config
			docker-compose images
			docker-compose top

			docker-compose pause
			stop ===>SIGTERM ===gracefull shutdown
			kill ===>SIGKILL ===> immediately terminates the process 

			docker-compose ps

			docker-compose kill
			docker-compose stop 

			docker-compose build 



## MicroService 
		docker build . -t anjaiahspr/todo-front-end:0.0.1-SNAPSHOT





## Reference Links 
		https://www.callicoder.com/spring-boot-docker-example/
		https://www.callicoder.com/spring-boot-mysql-react-docker-compose-example/
		Kubernates:
		https://www.callicoder.com/deploy-spring-mysql-react-nginx-kubernetes-persistent-volume-secret/
		https://dzone.com/articles/all-about-hibernate-manytomany-association
 
