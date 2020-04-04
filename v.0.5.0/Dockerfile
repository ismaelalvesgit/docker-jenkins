FROM jenkins/jenkins:lts

LABEL maintainer="Ismael Alves cearaismael1997@gmail.com"

ARG master_image_version="v.2.0.0"
ENV master_image_version $master_image_version

USER jenkins
# Plugin Setup
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt
# Auto Configuration Scripts
COPY groovy/* /usr/share/jenkins/ref/init.groovy.d/
COPY config/*.properties ${JENKINS_HOME}/config/