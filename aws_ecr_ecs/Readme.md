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
