FROM node:10 as nodejs

FROM jenkins/jenkins

LABEL maintainer="Ismael Alves cearaismael1997@gmail.com"
ARG master_image_version="v.2.2.2"
ENV master_image_version $master_image_version

USER root
# Platforms Install
RUN apt-get update -qq \
    && apt-get install -qqy apt-transport-https ca-certificates curl gnupg2 software-properties-common 
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
RUN add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"
RUN apt-get update  -qq \
    && apt-get install docker-ce=17.12.1~ce-0~debian -y
RUN apt-get install -y make git openjdk-8-jdk && rm -rf /var/lib/apt/lists/*
COPY --from=nodejs /usr/local/bin/node /usr/local/bin/node

USER jenkins
# # Backup & Recover
RUN mkdir /srv/backup && chown jenkins:jenkins /srv/backup

# Plugins Install
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

# Auto Setup Scripts
COPY src/main/groovy/* /usr/share/jenkins/ref/init.groovy.d/
COPY src/main/resources/*.properties /var/jenkins_home/config/
COPY src/main/resources/initials/*.file /var/jenkins_home/config/initials/

# Enviroments
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64

# Para configurações de Seguranca
COPY .ssh/* /var/jenkins_home/.ssh/

# Configurações Globais
COPY --chown=jenkins:jenkins config_jenkins /var/jenkins_home
RUN echo clear > /usr/share/jenkins/ref/jenkins.install.UpgradeWizard.state
RUN echo clear > /usr/share/jenkins/ref/jenkins.install.InstallUtil.lastExecVersion
