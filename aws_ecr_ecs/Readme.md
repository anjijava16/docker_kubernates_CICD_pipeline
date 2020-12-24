Amazon Elastic Container Registry (Amazon ECR) 
------------------------------------------------
1. Amazon Elastic Container Registry (Amazon ECR) is an AWS managed container image registry service that is secure, scalable, and reliable. Amazon ECR supports private container image repositories with resource-based permissions using AWS IAM. This is so that specified users or Amazon EC2 instances can access your container repositories and images. You can use your preferred CLI to push, pull, and manage Docker images, Open Container Initiative (OCI) images, and OCI compatible artifacts.

2. Amazon Elastic Container Registry (ECR) is a managed Docker container registry that makes it easy to store, manage, and deploy Docker container images. ECR supports private Docker registries with resource-based permissions using AWS IAM, so specific users and instances can access images. Using ECR simplifies going from development to production, and eliminates the need to operate your own container repositories or worry about scaling the underlying infrastructure, while hosting your images in a highly available and scalable architecture.


AWS Account Details :
--------------------------------
ACCOUNT=12987777 # REMEMBER TO REPLACE THE AWS ACCOUNT ID
DOCKER_CONTAINER=my-ubuntu-batch-job
REPO=${ACCOUNT}.dkr.ecr.us-west-2.amazonaws.com/${DOCKER_CONTAINER}
TAG=build-$(date -u "+%Y-%m-%d")


echo "Building Docker Image..."
---------------------------------------------------
docker build -t $DOCKER_CONTAINER .


echo "Authenticating against AWS ECR..."
--------------------------------------------------
eval $(aws ecr get-login --no-include-email --region us-west-2)


echo "Tagging ${REPO}..."
--------------------------------------------------
docker tag $DOCKER_CONTAINER:latest $REPO:$TAG
docker tag $DOCKER_CONTAINER:latest $REPO:latest


echo "Deploying to AWS ECR"
--------------------------------------------------
docker push $REPO



What Is AWS ECS?
----------------------------------------------------------------
1. Amazon Elastic Container Service (Amazon ECS) is a container orchestration service that runs and manages Docker containers. 
It runs clusters of virtual machines on the Amazon cloud, while managing, scaling, and scheduling groups of containers on those machines across
multiple Availability Zones (AZs).ECS provides a convenient programmatic way to check and modify the state of your cluster, perform operations on containers, and 
directly access Amazon services related to your cluster, such as IAM, CloudWatch and CloudTrail.

2.ECS provides a convenient programmatic way to check and modify the state of your cluster, perform operations on containers, and directly access Amazon services related
to your cluster, such as IAM, CloudWatch and CloudTrail.

3. Amazon Elastic Container Service (Amazon ECS) is a highly scalable, high performance container orchestration service that supports Docker containers and allows you to easily run
and scale containerized applications on AWS. ECS is built to perform at scale, offers high availability and security, and is deeply integrated with a variety of AWS services, 
including Elastic Load Balancing, Amazon VPC, AWS IAM, and more. Additionally, Amazon ECS features AWS Fargate, so you can deploy containers without provisioning servers,
ultimately reducing management overhead.
4. There can be arguments made in favor of ECS over EKS in that it is simpler to use, provides heightened security due to its  integration with IAM, and is more cost-effective. But before we delve into this further, let’s briefly review Amazon EKS.

Amazon EKS
-----------------------------------------------------------------
Amazon Elastic Container Service for Kubernetes (Amazon EKS) makes it easy to deploy, manage, and scale containerized applications using Kubernetes on AWS.
Since this service leverages the open-source tool Kubernetes, all applications managed by Amazon EKS are fully compatible with applications managed by any 
standard Kubernetes environment. In that sense, it can be argued that Amazon EKS is more versatile than Amazon ECS.

