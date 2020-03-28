FROM tomcat:8.5.47-jdk8-openjdk
MAINTAINER "Anjaiah Methuku"

RUN rm -rf /usr/local/tomcat/webapps/*

# Transfer our WAR
EXPOSE 8181
CMD ["catalina.sh","run"]
