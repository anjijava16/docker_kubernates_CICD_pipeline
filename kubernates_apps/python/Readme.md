# Docker Example 
1. docker build -t $(image name)
  
# docker build example 
1. docker build -t hello-api .

#  Docker run
1. docker run -p 3050:3000 hello-api. 

# Docker Login
1. docker login --username=$(username) --email=$(email)
  
# docker images
1. docker images.

# docker tag
1. docker tag $(image ID) $(hub repo)

# Docker tag example
docker tag 3aeaa19c2897 anjaiahspr/hello-api.

# Docker push
1 docker push $(hub repo).

# Pods
1. The pod is the smallest computational unit that can be deployed within our Kubernetes cluster. Inside the pod runs one or more containers.

# Config file
1. To create a pod, we need nothing more than a YAML file:

# Services
1. We use services to set up networking in our clusters. There are several types of services that control networking in different ways. The one that we will be using is a NodePort.
2. However, things are a little different in the spec. First, we set our service type to NodePort. We explained this earlier.

Next, we set up our networking ports. Here, we have three ports:

port: 3050 tells this service to communicate via its own 3050 port.
targetPort: 3000 tells us to communicate with our target object (our pod) using port 3000.
nodePort: 32020 is the external port we use. Anyone who wants to communicate with our service from outside the cluster must use port 32020 (this can be any number from 30,000–32,767).

[ec2-user@ip-172-31-93-105 ~]$ kubectl apply -f myapp.yml
pod/api-pod created
[ec2-user@ip-172-31-93-105 ~]$ kubectl get pods
NAME           READY   STATUS    RESTARTS   AGE
api-pod        1/1     Running   0          9s
my-first-pod   1/1     Running   0          12m
[ec2-user@ip-172-31-93-105 ~]$ vi myservice.yml
[ec2-user@ip-172-31-93-105 ~]$ kubectl apply -f myservice.yml

  
  
  
