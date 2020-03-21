# @Author Ismael Alves
FROM jenkins/jenkins:2.112
USER root
RUN apt-get update && apt-get install -y make git openjdk-8-jdk
USER jenkins
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64