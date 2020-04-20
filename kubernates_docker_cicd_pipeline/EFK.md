EFK

#Fluentd:
Fluentd: Fluented is a populara open source collector that will setup on our kubernates notes to tail container log files.
filter and transform the log data , and deliver to
the elasticsearch cluster 


Fluented ==> Store in ElasticSearch ==> UI Kibana


kubectl get pods -n kube-system

kubectl logs applicationNAME -n kube-system
 kubectl logs metrics-server-665847c665-rt9r7 -n kube-system
 
  kubectl get namespace
  
  kubectl get svc -n efklog