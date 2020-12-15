
## Spring Boot, Spring CRUD(H2DB Service) 



# Pre-requisites:
--------
    - Install Git
    - Install Maven
    - Install Docker
    - EKS Cluster
    

# Clone code from github:
-------
    git clone https://github.com/anjijava16/docker_kubernates_CICD_pipeline.git
    cd docker_kubernates_CICD_pipeline/Docker_works/springboot_h2db/
    

# Build Maven Artifact:
-------
    mvn clean install -DskipTests=true
	
#  Create Dockerfile 
 
``` 
FROM openjdk:8

EXPOSE 8080

ADD target/iwinner-order-services-1.0-SNAPSHOT.jar iwinner-order-services-1.0-SNAPSHOT.jar

ENTRYPOINT ["java","-jar","iwinner-order-services-1.0-SNAPSHOT.jar"]

```
  
# Step 1: Docker login
	docker login
	
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
    
    


# Pull Docker file and build and run 

# Step1: Pull image and run it 
     docker run -p 8080:8080 anjaiahspr/iwinner_order_service

#  Step2: Check URL 
    http://localhost:8080/swagger-ui.html#/
# Change port number 
    docker run -p 8886:8080 anjaiahspr/iwinner_order_service

# Running in Kubectl file in PODS (worker)

# Create and Deploy kubectl file 	:
     kubectl apply -f iwinner-order-service.yml

#  Step2: Check URL 
    http://localhost:8080/swagger-ui.html#/

# Check secrets:
    kubectl get secrets
    kubectl get configmaps
    kubectl get pv
    kubectl get pvc
    kubectl get deploy
    kubectl get pods
    kubectl get svc

# Cluean UP process:
    kubectl delete deploy iwinner-order-service.yml	 
	 