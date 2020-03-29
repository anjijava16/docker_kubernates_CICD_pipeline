
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


elcome@welcome-Inspiron-5558:~/Desktop/Docker/Code/Chapter 7/fleetman-webapp$ docker volume --help

Usage:	docker volume COMMAND

Manage volumes

Commands:
  create      Create a volume
  inspect     Display detailed information on one or more volumes
  ls          List volumes
  prune       Remove all unused local volumes
  rm          Remove one or more volumes

```

welcome@welcome-Inspiron-5558:~/Desktop/Docker/Code/Chapter 7/fleetman-webapp$ docker volume rm mydata
Error response from daemon: remove mydata: volume is in use - [3de1320026631ea67710aa8c1cab6ab4f9d128542c1bde0e8a7b4cbc8e4387ab]
welcome@welcome-Inspiron-5558:~/Desktop/Docker/Code/Chapter 7/fleetman-webapp$ docker container ls
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
welcome@welcome-Inspiron-5558:~/Desktop/Docker/Code/Chapter 7/fleetman-webapp$ docker stop database
database
welcome@welcome-Inspiron-5558:~/Desktop/Docker/Code/Chapter 7/fleetman-webapp$ docker container prune
WARNING! This will remove all stopped containers.
Are you sure you want to continue? [y/N] y
Deleted Containers:
3de1320026631ea67710aa8c1cab6ab4f9d128542c1bde0e8a7b4cbc8e4387ab
ef97872fc8a102dea6b0449d7625bde63973b0b3709183591ea923f57cb36d0d

Total reclaimed space: 108B
welcome@welcome-Inspiron-5558:~/Desktop/Docker/Code/Chapter 7/fleetman-webapp$ docker volume rm mydata
mydata
welcome@welcome-Inspiron-5558:~/Desktop/Docker/Code/Chapter 7/fleetman-webapp$ 

```
