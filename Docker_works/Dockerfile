FROM ubuntu:latest

LABEL maintainer="Anajaiah Methuku"
LABEL creationdate="19th Nov,2020"



RUN apt-get update && apt-get install -y openjdk-8-jdk


WORKDIR /usr/local/bin/

ADD test-program.jar .

CMD ["java","-jar","test-program.jar"]
