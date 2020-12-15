
 # ###########Spring CRUD(H2DB Service) 

# Step 1: Create Dockerfile 
 
``` 
FROM openjdk:8

EXPOSE 8080

ADD target/iwinner-order-services-1.0-SNAPSHOT.jar iwinner-order-services-1.0-SNAPSHOT.jar

ENTRYPOINT ["java","-jar","iwinner-order-services-1.0-SNAPSHOT.jar"]

```

# Step 2: Build Dockerfile 
    docker build -f Dockerfile -t iwinner_order_service .

#  Step 3: Check Images is created or not 
    docker images
    iwinner_order_service         latest       0e589c000ce1   17 seconds ago   566MB

#  Step4: Create tag our docker images 
    docker tag iwinner_order_service anjaiahspr/iwinner_order_service

# Step 5: Push to docker hub 
    docker push anjaiahspr/iwinner_order_service

# Step6: ##Pull image and run it 
     docker run -p 8080:8080 anjaiahspr/iwinner_order_service

#  Step7: Check URL 
    http://localhost:8080/swagger-ui.html#/
# Change port number 
    docker run -p 8886:8080 anjaiahspr/iwinner_order_service
    
    
