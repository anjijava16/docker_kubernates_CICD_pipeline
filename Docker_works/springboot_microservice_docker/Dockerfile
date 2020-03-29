FROM openjdk:8u131-jdk-alpine

MAINTAINER "Anjaiah Methuku"

EXPOSE 8080

WORKDIR /usr/local/bin/

COPY ./target/fleetman-0.0.1-SNAPSHOT.jar webapp.jar

ENV JAVA_OPTS="-Dspring.profiles.active=docker-demo"

# Transfer our WAR

CMD ["java","-Dspring.profiles.active=docker-demo","-jar","webapp.jar"]
