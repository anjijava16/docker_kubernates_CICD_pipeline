# Kubernates (KUBEADAM) Setup Here 

# Step 1 – Update Ubuntu and install apt-transport-https
		sudo apt-get update
		sudo apt-get install apt-transport-https
		curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -



# Step 2 – Add Ubuntu apt repo for docker kubeadm kubectl kubelet kubernetes-cni

		cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
		deb http://apt.kubernetes.io/ kubernetes-xenial main
		EOF


# Step 3 – Install docker kubeadm kubectl kubelet kubernetes-cni

	apt-get update
	apt-get install -y docker.io kubeadm kubectl kubelet kubernetes-cni
	apt-get install -y docker.io kubeadm kubectl kubelet kubernetes-cni


# Step4:Finally, initialize a kubernetes clusters

	kubeadm init

	kubeadm join 172.31.34.199:6443 --token 29i13w.irvfj2g2nkffmz5y \
		--discovery-token-ca-cert-hash sha256:a6201baeac04e206a9c6e578254a84c820807a31dc6216fbbc3d2f0da074ea1c



# Step4 : B


		  To start using your cluster, you need to run the following as a regular user:

		  mkdir -p $HOME/.kube
		  sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
		  sudo chown $(id -u):$(id -g) $HOME/.kube/config

			
	
# Step 6 – Setup Workstation in the Master node only. You can be regular user for it.
		$ mkdir -p $HOME/.kube
		$ sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
		$ sudo chown $(id -u):$(id -g) $HOME/.kube/config

# Step 8 – Install Kubernetes pod networking
		kubectl apply -f "https://cloud.weave.works/k8s/net?k8s-version=$(kubectl version | base64 | tr -d '\n')"
		kubectl get nodes
		kubectl get pods --all-namespaces
		kubectl get nodes


# Worker System(NODE) 

# Step 9 – Setup nodes [ In the node aka worker ]

		Follow Step 1 
		Follow Step 2
		Follow Step 3
		Run following commands which we got from kubeadm init
		$ kubeadm join 172.31.31.106:6443 --token pdn6in.r0dzhpx1ucrs69au --discovery-token-ca-cert-hash sha256:a9385951e659a3c67f55ccfbdc1169b1f660ba09aaf8cc6d5cc96d71b71900d2
		
# Check server 
		$ kubectl get nodes
		$ kubectl get pods --all-namespaces
		$ kubectl get nodes
		$ kubectl get pods --all-namespaces


# Reference Links :
		https://www.devopsschool.com/blog/setup-kubernetes-cluster-using-kubeadm-calico-and-rbac-in-ubuntu/
		https://www.devopsschool.com/blog/setting-up-kubernetes-clusters-using-kubeadm-manual-way-in-ubuntu-16-04-xenial/

