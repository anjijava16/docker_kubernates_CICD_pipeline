
 docker container ls
 VOLUME /var/lib/mysql 
 
 docker container inspect 25
 
 docker volume ls 
 docke container prune
 docker volume prune 
 
 docker container run -v mydata:/var/lib/mysql --network my-network --name database  -e MYSQL_ROOT_PASSWORD=password -e MYSQL_DATABASE=fleetman -d mysql:5
 docker volume inspect mydata
 docker volume ps 
 
 ```
 welcome@welcome-Inspiron-5558:~/Desktop/Docker/Code/Chapter 7/fleetman-webapp$ docker volume inspect mydata
[
    {
        "CreatedAt": "2020-03-29T01:16:34-04:00",
        "Driver": "local",
        "Labels": null,
        "Mountpoint": "/var/snap/docker/common/var-lib-docker/volumes/mydata/_data",
        "Name": "mydata",
        "Options": null,
        "Scope": "local"
    }
]

```
