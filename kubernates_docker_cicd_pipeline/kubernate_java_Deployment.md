
# Java Changes for JenkinDeployent in Kubernaes Cluster

# Change Jenkinsfile

#ProjectName : petclinic

LOcation 1: Jenkinsfile
Location 2: 
	https://github.com/anjijava16/petclinic/blob/master/Jenkinsfile


 kubectl describe pod petclinic-deployment-5b7db58f6-gmf84
 kubectl get svc
 
 http://52.15.215.83:32750/
 
 helm delete petclinic-app --purge 
 
 
 DOwnload https://github.com/anjijava16/metric-server.git inside the KubeMaster server
 
 kubectl create -f .


kubectl get pods -n kube-system

kubectl logs metrics-server-665847c665-rt9r7 -n kube-system


kubectl top pods

kubectl top pods -n kube-system
kubectl top nodes


## Configure Horizonatl Pod AutoScaler for auto scaling of PODS

 kubectl get pods
  kubectl get hpa



# Siege is a stress tester for HTTP/HTTPS
		yum -y install epel-release
		yum -y install siege
		siege -q -c 2 -t 2m http://ip:port
		q = quiet mode
		c = concurrent
		2m = time period
# Install stress package inside the Application pod
	apt-get update
	apt-get install stress
#	Execute stress command to increase memory utilization on pod
	stress --vm 1 --vm-bytes 500M

# Execute command 
  kubectl exec -it petclinic-deployement sh
  
