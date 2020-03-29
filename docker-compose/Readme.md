# Step 1: Install docker 
         pip install -U docker-compose
# Step 2: create docker compose 
            docker-compose.yml
# Step 3: Check the validity 
            docker-compose config 
# Step 4: Run the docker-compose.yml file 
          docker-compose up -d 
		    (OR)
		  docker-compose up 
# Step 5: Basic File 
  ```
  
  version: "3"

services:

   web:
       image: nginx
   database:
       image: redis    
```

http://localhost:9090/   
		  
# Step docker ps 

# Step 5: Stop the docker compose 
    docker-compose stop or down 


# How to increase / scale the application

docker-compose up -d --scale  database=4	
		  
