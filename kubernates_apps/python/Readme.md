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
  
  
  
