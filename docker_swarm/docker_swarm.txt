docker swarm init 
docker swarm init --advertise-addr 192.168.0.47 
Copy Here : docker swarm join --token SWMTKN-1-5nq2ci8as712cbiygxlfmbl1hutx2nyjkl0okdjkvukvhs3nv0-33stt3ggz5okxd2kms3a5i9cr 192.168.0.47:2377


Past to Another Command :
docker swarm join --token SWMTKN-1-5nq2ci8as712cbiygxlfmbl1hutx2nyjkl0okdjkvukvhs3nv0-33stt3ggz5okxd2kms3a5i9cr 192.168.0.47:2377

 docker node ls
ID                            HOSTNAME            STATUS              AVAILABILITY        MANAGER STATUS      ENGINE VERSION
8gxh5l8p0ms0zzc3c9srthd9g     node1               Ready               Active                                  19.03.4
x78vybb5sh1cqb9j71455zfo3 *   node2               Ready               Active              Leader              19.03.4
[node2] (local) root@192.168.0.47 ~
$ 

$ docker network create --driver overlay fleetman-network
29a6dbstmh0wgzoqds71aei9w

$ docker network ls
NETWORK ID          NAME                DRIVER              SCOPE
d068c710e1a5        bridge              bridge              local
5e7ef01d9861        docker_gwbridge     bridge              local
29a6dbstmh0w        fleetman-network    overlay             swarm
0597ab4195a3        host                host                local
n2bkqaj11s08        ingress             overlay             swarm
51c9feff00c4        none                null                local
[node2] (local) root@192.168.0.47 ~
$ 


Login in Another Node:
docker network ls 



## Create a Service :
docker service create -d --network fleetman-network -e MYSQL_ROOT_PASSWORD=password -e MYSQL_DATABASE=fleetman --name database mysql:5

$ docker service create -d --network fleetman-network -e MYSQL_ROOT_PASSWORD=password -e MYSQL_DATABASE=fleetman --name database mysql:5
0w5xmzwi70jntqsv07np1fijt
[node2] (local) root@192.168.0.47 ~
$ docker service ls
ID                  NAME                MODE                REPLICAS            IMAGE               PORTS
0w5xmzwi70jn        database            replicated          1/1                 mysql:5             
[node2] (local) root@192.168.0.47 ~
$ 


docker container ls 



docker service create -d --network fleetman-network -p 80:8080 --name fleetman-webapp anjaiahspr/fleetman-webapp

$ docker service create -d --network fleetman-network -p 80:8080 --name fleetman-webapp anjaiahspr/fleetman-webapp
n55j83772otvxkrqzfbavzy8g
[node2] (local) root@192.168.0.47 ~
$ 


docker service ls 

docker service logs -f database 
docker service logs -f fleetman-webapp


http://ip172-18-0-43-bq4k0o2osm4g00ajdhtg-80.direct.labs.play-with-docker.com/

