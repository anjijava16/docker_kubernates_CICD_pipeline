
sudo su - 

sudo - i

sudo su -

su - jenkins 




http://ec2-3-21-27-236.us-east-2.compute.amazonaws.com:8080/mindAdda/swagger-ui.html
Android Studio

Visual Studio code 2017 
flatter


flutter doctor 




http://github.com/prawinkorvi


3.15.203.197


ssh -i "newKey.pem" ec2-user@ec2-3-15-203-197.us-east-2.compute.amazonaws.com


sudo -i


yum rm jdk7

yum -y install wget
wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
yum -y install jenkins


 service jenkins start
 chkconfig jenkins on 

  sudo yum install java-1.8.0-openjdk-devel



http://ec2-3-15-203-197.us-east-2.compute.amazonaws.com:8080/

0422540fb426477b896df866a472c377 

http://ec2-3-15-203-197.us-east-2.compute.amazonaws.com:8080/

source ~/.bash_profile
vi  ~/.bash_profile
/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.242.b08-0.amzn2.0.1.x86_64



sudo apt install openjdk-8-jdk
yum -y install openjdk-8-jdk

yum rm openjdk-8-jdk
export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk
export PATH=$JAVA_HOME/bin:$PATH

export M2_HOME=/opt/apache-maven-3.6.3
export PATH=$M2_HOME/bin:$PATH


systemctl start docker
systemctl enable docker
chkconfig docker on



vi /etc/passwd


change to /bin/bash

su - jenkins


cat /etc/group | grep -i docker 


  sudo groupadd docker
  sudo usermod -aG docker jenkins
  sudo chmod 777 /var/run/docker.sock
  
  



  Kubernates Installation with Kubeadm 
  
  Master 1. t2.medium
  Workers 2 t2.micro servers
  
  Master Server (At least 2 CPUS)
  Enable Ports for Master Server
  6443
  32750
  10250
  4443
  443
  8080
  179
  
  Enable Ports on workers Nodes
  10250 & 179
  


CentOS User : centos 

sudo su -

Change Hostname:
vi /etc/hostname
Name Change to kubemaster


systemctl enable docker
systemctl start docker

systemctl status docker


swapoff -a
sysctl --system

yum install -y kubeadm-1.15.6-0.x86_64 kubelet-1.15.6-0.x86_64 kubectl-1.15.6-0.x86_64


systemctl enable kubelet
systemctl start kubelet
systemctl status kubelet



kubeadm init --apiserver-advertise-address=172.31.14.205 --pod-network-cidr=192.168.0.0/16


kubeadm join 172.31.14.205:6443 --token n84q94.fit5mtw6y3zj97gm \
    --discovery-token-ca-cert-hash sha256:979b814a7feb6e660c790baf99f8b104ba025f9bca4c4a2d6cc2ead92173be0f
	
	
Created User account
ID: anjaiahspr
Password: Maxis@123


mkdir /home/anjaiahspr/.kube
cp /etc/kubernetes/admin.conf /home/anjaiahspr/.kube/config
chown -R anjaiahspr:anjaiahspr /home/anjaiahspr/.kube/config
chown -R 700 /home/anjaiahspr/.kube/config	



[anjaiahspr@kubemaster ~]$ kubeadm token create --print-join-command
kubeadm join 172.31.14.205:6443 --token 5uk4vs.r141oe00tikqkxrc     --discovery-token-ca-cert-hash sha256:979b814a7feb6e660c790baf99f8b104ba025f9bca4c4a2d6cc2ead92173be0f
[anjaiahspr@kubemaster ~]$


[anjaiahspr@kubemaster ~]$ kubectl get nodes
NAME           STATUS   ROLES    AGE   VERSION
kubemaster     Ready    master   12m   v1.15.6
kubeworker01   Ready    <none>   25s   v1.15.6
kubeworker02   Ready    <none>   74s   v1.15.6
[anjaiahspr@kubemaster ~]$


kubectl get pods -n kube-system 

[anjaiahspr@kubemaster ~]$ kubectl get pods -n kube-system
NAME                                       READY   STATUS    RESTARTS   AGE
calico-kube-controllers-56cd854695-9nmp6   1/1     Running   0          5m24s
calico-node-k7zcr                          1/1     Running   0          108s
calico-node-lnx9m                          1/1     Running   0          5m24s
calico-node-nw5dn                          1/1     Running   0          2m37s
coredns-5c98db65d4-mkdqs                   1/1     Running   0          13m
coredns-5c98db65d4-smb29                   1/1     Running   0          13m
etcd-kubemaster                            1/1     Running   0          12m
kube-apiserver-kubemaster                  1/1     Running   0          12m
kube-controller-manager-kubemaster         1/1     Running   0          12m
kube-proxy-2kccw                           1/1     Running   0          108s
kube-proxy-kccgp                           1/1     Running   0          2m37s
kube-proxy-zk7mb                           1/1     Running   0          13m
kube-scheduler-kubemaster                  1/1     Running   0          12m
[anjaiahspr@kubemaster ~]$


Helm : It is tool for Kubernates that helps you install and manage appliations

Basically we use helm for the repitive tasks and we can do applications deploymenet easy,standalinzed and it can be resuable 

Client Helm CLI                              ====> Kubernates Cluster 
                                                       Tiller POD Kubernate master ---> Kubeworker1, Kubeworker2
													   
/.kube/config/
/.helm

Helm ===>  Setup in Jenkins
Tiller ===> Setup in Kubernates 

If #Docker is like an airplane, then #Kubernetes is like an airport. 
Right?

Use Docker to pack and ship your app
Use Kubernetes to deploy and scale your app

You need a container runtime like Docker Engine to start and stop containers on a host. When you have a bunch of containers running across a bunch of hosts, you need an orchestrator to manage things like: 
Where will the next container start? 
How do you make a container highly available? 
How do you control which containers can communicate with other containers? 
That’s where an orchestrator such as Kubernetes comes in.





// https://github.com/prawinkorvi/Docs/blob/master/Jenkinsserver-Installation.MD
EC2 : l2 medium

# Login As ROOT user 
   sudo -i 
## Install JDK  :
	sudo yum install java-1.8.0-openjdk-devel
	sudo yum install java-1.8.0 -y
	sudo yum remove java-1.7.0-openjdk -y

## Install Jenkins :
		yum -y install wget
		wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
		rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
		yum -y install jenkins


## JDK Install Path :
/usr/lib/jvm/java-1.8.0-openjdk/bin/





sudo service

sudo service start jenkins





# Start jenkins service
service jenkins start 
systemctl start jenkins

# Setup Jenkins to start at boot,
systemctl enable jenkins
service jenkins enable


#Server IS UP
chkconfig jenkins on

Setting JAVA_HOME 
export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk/bin/
export PATH=$JAVA_HOME/bin:$PATH


##Uninstall
yum remove java-1.7.0-openjdk -y


/var/lib/jenkins/secrets/initialAdminPassword
Username: anjaiahspr
Password: 12345
http://3.17.186.49:8080/




// https://github.com/prawinkorvi/Docs/blob/master/Jenkinsserver-setup.MD


# Maven Setup:
		yum install wget
		wget http://apachemirror.wuchna.com/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz
		tar -xvzf apache-maven-3.6.3-bin.tar.gz

		export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk
		export PATH=$JAVA_HOME/bin:$PATH

		export M2_HOME=/opt/apache-maven-3.6.3
		export M2=$M2_HOME/bin


# Install GIT 
    ``` yum install git ```


# Install Docker
		yum install docker
#Start the docker 	
	systemctl start docker
	service docker start
# Enable the Docker 	
	systemctl enable docker
	service docker enable 
# Enable the Chkconfig 
chkconfig docker on	


## Assign shell to jenkins user

vi /etc/passwd
change shell from /bin/false to /bin/bash

# Check the docker 
	cat /etc/group | grep -i docker
	
# provide permissions to jenkins user in jenkins server to access docker
  sudo groupadd docker
  sudo usermod -aG docker jenkins
  sudo chmod 777 /var/run/docker.sock
  
 

###########################################################################################

https://github.com/prawinkorvi/Docs/blob/master/Kubernetes-Installation.MD


#   Kubernates Installation with Kubeadm 
  
  1. Master 1. t2.medium::  CENTOS 7 t2.medium (It will come 2 cores)
  2. Workers 2 t2.micro servers
  sudo su -
  
  Master Server (At least 2 CPUS) CENTOS 7 t2.medium (It will come 2 cores)
  Enable Ports for Master Server
  6443
  32750
  10250
  4443
  443
  8080
  179
  
  Enable Ports on workers Nodes
  10250 & 179
  


Kubeadm
Kubelet
Kubectl

CentOS User : centos 7

sudo su -

Change Hostname:
vi /etc/hostname
Name Change to kubemaster

rebot after changes in the hostname 

mastername : kubemaster
worker node: kubeworker01 && kubeworker02

# Docker Installation

yum install -y -q yum-utils device-mapper-persistent-data lvm2 > /dev/null 2>&1
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo > /dev/null 2>&1
yum install -y -q docker-ce >/dev/null 2>&1

systemctl start docker
systemctl enable docker
systemctl status docker


#Disable SELinux
	setenforce 0
	sed -i --follow-symlinks 's/^SELINUX=enforcing/SELINUX=disabled/' /etc/sysconfig/selinux

#Disable Firewall
	systemctl disable firewalld
	systemctl stop firewalld
#Disable swap
	sed -i '/swap/d' /etc/fstab
	swapoff -a
	Update sysctl settings for Kubernetes networking
	cat >>/etc/sysctl.d/kubernetes.conf<<EOF
	net.bridge.bridge-nf-call-ip6tables = 1
	net.bridge.bridge-nf-call-iptables = 1
	EOF
	sysctl --system
# Kubernetes Setup
# Add yum repository
		cat >>/etc/yum.repos.d/kubernetes.repo<<EOF
		[kubernetes]
		name=Kubernetes
		baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64
		enabled=1
		gpgcheck=1
		repo_gpgcheck=1
		gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg
				https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
		EOF
# Install Kubernetes
	yum install -y kubeadm-1.15.6-0.x86_64 kubelet-1.15.6-0.x86_64 kubectl-1.15.6-0.x86_64

# Start 
	systemctl start kubelet
	systemctl enable kubelet


## Same above steps in the KUBWOrker nodes 



## Only For Master Node :

ifconfig: 172.31.15.76

# Initialize Kubernetes Cluster (On kmaster)
kubeadm init --apiserver-advertise-address=172.31.15.76 --pod-network-cidr=192.168.0.0/16

useradd anjaiahspr
passwd anjaiahspr
Password:12345


mkdir /home/anjaiahspr/.kube
chown -R anjaiahspr:anjaiahspr /home/anjaiahspr/.kube
chmod -R 755 /home/anjaiahspr/.kube/
cp /etc/kubernetes/admin.conf /home/anjaiahspr/.kube/config


wget https://docs.projectcalico.org/v3.9/manifests/calico.yaml

kubectl create -f https://docs.projectcalico.org/v3.9/manifests/calico.yaml

kubectl creae -f calico.yaml

kubeadm token create --print-join-command for token 


# Execute both worker nodes 
kubeadm join 172.31.15.76:6443 --token qyhsvt.7xgjocl53r9qns3s     --discovery-token-ca-cert-hash sha256:a0c98c1ffdf476a32e5c2fd4976f23ddc7dfb620890d26a8dbf9a0e18cbf717a
          (OR)
kubeadm join 172.31.15.76:6443 --token 17ln6l.5ib945ivkfh80nmw     --discovery-token-ca-cert-hash sha256:a0c98c1ffdf476a32e5c2fd4976f23ddc7dfb620890d26a8dbf9a0e18cbf717a

# Master node check data nodes joins 
 kubectl get nodes
 
 
# Get Nodes status
kubectl get nodes

# Get component status
kubectl get cs

# Check the PODS working or not 
  kubectl get pods -n kube-system



### Helm : 
  It is tool for Kubernates that help you install and manage appliations 
  
  Help Is specially Kubernates cluster 
  YML FIle that will deploy using Kubectl command to deploy 
  Redhot or cent yum is package manager insall any software
  Ubunutu     apt is package manager any software 
  
  Helm use install any software in teh Kubernates 
 
## Arch of Helm 
          
		  Client (Helm CLI)
		  Jenkins Server 
		    ./kube/config                     ============>> Kubernates Cluster (tiller POD) kubemaster ---> Kubeworker1 && kubeworker2
			./.helm 
 

 
# Installing Helm on Jenkins server
# Jenkins Server :
vi /etc/sudoers
jenkins ALL=(ALL) NOPASSWD: ALL


curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 > get_helm.sh
chmod 700 get_helm.sh
./get_helm.sh -v v2.14.1



Login to su - jenkins


# Copy admin.conf file from Kubernetes master to Jenkins user's home directory in Jenkins server
	mkdir /var/lib/jenkins/.kube
	Manually copy /etc/kubernetes/admin.conf file to /var/lib/jenkins/.kube/config file
    chown -R jenkins:jenkins /home/jenkins/.kube

#Run 'helm init' in Jenkins Server to configure helm
   kubectl -n kube-system create serviceaccount tiller



$ su - anjaiahspr
$kubectl get deployment -n kube-system 



## Check Helm Version 

$ helm version 









swapoff -a
sysctl --system

yum install -y kubeadm-1.15.6-0.x86_64 kubelet-1.15.6-0.x86_64 kubectl-1.15.6-0.x86_64


systemctl enable kubelet
systemctl start kubelet
systemctl status kubelet



kubeadm init --apiserver-advertise-address=172.31.14.205 --pod-network-cidr=192.168.0.0/16


kubeadm join 172.31.14.205:6443 --token n84q94.fit5mtw6y3zj97gm \
    --discovery-token-ca-cert-hash sha256:979b814a7feb6e660c790baf99f8b104ba025f9bca4c4a2d6cc2ead92173be0f
	
	
Created User account
ID: anjaiahspr
Password: Maxis@123


mkdir /home/anjaiahspr/.kube
cp /etc/kubernetes/admin.conf /home/anjaiahspr/.kube/config
chown -R anjaiahspr:anjaiahspr /home/anjaiahspr/.kube/config
chown -R 700 /home/anjaiahspr/.kube/config	



[anjaiahspr@kubemaster ~]$ kubeadm token create --print-join-command
kubeadm join 172.31.14.205:6443 --token 5uk4vs.r141oe00tikqkxrc     --discovery-token-ca-cert-hash sha256:979b814a7feb6e660c790baf99f8b104ba025f9bca4c4a2d6cc2ead92173be0f
[anjaiahspr@kubemaster ~]$


[anjaiahspr@kubemaster ~]$ kubectl get nodes
NAME           STATUS   ROLES    AGE   VERSION
kubemaster     Ready    master   12m   v1.15.6
kubeworker01   Ready    <none>   25s   v1.15.6
kubeworker02   Ready    <none>   74s   v1.15.6
[anjaiahspr@kubemaster ~]$


kubectl get pods -n kube-system 

[anjaiahspr@kubemaster ~]$ kubectl get pods -n kube-system
NAME                                       READY   STATUS    RESTARTS   AGE
calico-kube-controllers-56cd854695-9nmp6   1/1     Running   0          5m24s
calico-node-k7zcr                          1/1     Running   0          108s
calico-node-lnx9m                          1/1     Running   0          5m24s
calico-node-nw5dn                          1/1     Running   0          2m37s
coredns-5c98db65d4-mkdqs                   1/1     Running   0          13m
coredns-5c98db65d4-smb29                   1/1     Running   0          13m
etcd-kubemaster                            1/1     Running   0          12m
kube-apiserver-kubemaster                  1/1     Running   0          12m
kube-controller-manager-kubemaster         1/1     Running   0          12m
kube-proxy-2kccw                           1/1     Running   0          108s
kube-proxy-kccgp                           1/1     Running   0          2m37s
kube-proxy-zk7mb                           1/1     Running   0          13m
kube-scheduler-kubemaster                  1/1     Running   0          12m
[anjaiahspr@kubemaster ~]$


Helm : It is tool for Kubernates that helps you install and manage appliations

Basically we use helm for the repitive tasks and we can do applications deploymenet easy,standalinzed and it can be resuable 

Client Helm CLI                              ====> Kubernates Cluster 
                                                       Tiller POD Kubernate master ---> Kubeworker1, Kubeworker2
													   
/.kube/config/
/.helm
