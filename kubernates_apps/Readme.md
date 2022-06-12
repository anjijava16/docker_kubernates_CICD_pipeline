# Kubernates Architecture 
1. Kubernetes cluster is collection of Nodes – either physical or virtual network where Kubernetes (Kubernetes components) installed

# Nodes details

    Machine either physical or virtual where Kuebernatics is installed
    Worker machine where containers are launched by Kubernatics
    Each node is managed by control plane
    There are two types of Nodes
        Master Node
        Worker Node
    Node Name – naming convention / best practices
        Node name must be unique.
        Name identifies the Node
        Node name must be a valid DNS subdomain name
            contain no more than 253 characters
            contain only lowercase alphanumeric characters, ‘-‘ or ‘.’
            start with an alphanumeric character
            end with an alphanumeric character
