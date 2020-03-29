
 docker container ls
 VOLUME /var/lib/mysql 
 
 docker container inspect 25
 
 docker volume ls 
 docke container prune
 docker volume prune 
 
 docker container run -v mydata:/var/lib/mysql --network my-network --name database  -e MYSQL_ROOT_PASSWORD=password -e MYSQL_DATABASE=fleetman -d mysql:5
 docker volume inspect mydata
 docker volume ps 
 
