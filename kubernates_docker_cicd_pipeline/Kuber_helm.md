https://github.com/ashwanikumar04/jenkins-pipeline
https://github.com/prawinkorvi/cloudfreak
https://github.com/prawinkorvi/Docs/blob/master/Helm-tiller-configuration.md
https://github.com/anjijava16/daily-coding-problems



Login As JenkinServer as jenkin User 
sudo su -
su -jenkins 

/var/lib/jenkins/.helm


-bash-4.2$ more repositories.yaml
```
apiVersion: v1
generated: "2020-04-12T16:00:31.793040924Z"
repositories:
- caFile: ""
  cache: /var/lib/jenkins/.helm/repository/cache/stable-index.yaml
  certFile: ""
  keyFile: ""
  name: stable
  password: ""
  url: https://kubernetes-charts.storage.googleapis.com
  username: ""
- caFile: ""
  cache: /var/lib/jenkins/.helm/repository/cache/local-index.yaml
  certFile: ""
  keyFile: ""
  name: local
  password: ""
  url: http://127.0.0.1:8879/charts
  username: ""

```
helm --help
helm list 
helm search nginx
helm search jenkins
helm search mongodb

helm install stable/nginx-ingress --name mynginx
helm fetch stable/nginx-ingress 
tar -xvzf nginx-ingress-1.36.0.tgz

 helm package nginx-ingress
 helm install nginx-ingress-1.37.0.tgz --name myngix
 
 
#Get PODS 
kubectl get pods
kubectl get deployment
kubectl get svc




## Helm Charts ::

helm create test

http://18.224.63.21:32265/





   
 Jenkins Manage Plugin Accetiosn:
Jenkins URL ---> Manage Jenkins ---> Manage Plugins ---> 

Add JDK8 and Maven to Jenkisn Global Path :


env | grep -i java

env | grep -i maven 

$ env 
LESS_TERMCAP_mb=
HOSTNAME=ip-172-31-7-108
LESS_TERMCAP_md=
LESS_TERMCAP_me=
SHELL=/bin/bash
TERM=xterm
HISTSIZE=1000
EC2_AMITOOL_HOME=/opt/aws/amitools/ec2
LESS_TERMCAP_ue=
USER=root
LS_COLORS=rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=01;05;37;41:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=01;36:*.au=01;36:*.flac=01;36:*.mid=01;36:*.midi=01;36:*.mka=01;36:*.mp3=01;36:*.mpc=01;36:*.ogg=01;36:*.ra=01;36:*.wav=01;36:*.axa=01;36:*.oga=01;36:*.spx=01;36:*.xspf=01;36:
SUDO_USER=ec2-user
EC2_HOME=/opt/aws/apitools/ec2
SUDO_UID=500
USERNAME=root
LESS_TERMCAP_us=
PATH=/opt/apache-maven-3.6.3/bin:/usr/lib/jvm/java-1.8.0-openjdk//bin:/usr/local/sbin:/sbin:/bin:/usr/sbin:/usr/bin:/opt/aws/bin:/root/bin
MAIL=/var/spool/mail/root
PWD=/root
JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk/
AWS_CLOUDWATCH_HOME=/opt/aws/apitools/mon
LANG=en_US.UTF-8
HISTCONTROL=ignoredups
M2_HOME=/opt/apache-maven-3.6.3
SHLVL=1
SUDO_COMMAND=/bin/bash
HOME=/root
AWS_PATH=/opt/aws
AWS_AUTO_SCALING_HOME=/opt/aws/apitools/as
LOGNAME=root
AWS_ELB_HOME=/opt/aws/apitools/elb
LESSOPEN=||/usr/bin/lesspipe.sh %s
SUDO_GID=500
LESS_TERMCAP_se=
_=/bin/env



sudo -i
Login As ROOT
su - jenkins 
ls -ltr /var/lib/jenkins/workspace


# How to create ImagePullSecret :

kubectl create secret docker-registry regcred --docker-server=hub.docker.com --docker-username=anjaiahspr --docker-password=sriramsri123@@ --docker-email=anjaiahspr@gmail.com

kubectl get secret


## Verify Deploymen.yml File :
https://github.com/anjijava16/petclinic/blob/master/helm/petclinic/templates/deployment.yaml
  imagePullSecrets:
      - name: regcred
	  
	  


kubectl get secret
