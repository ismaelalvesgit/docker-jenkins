# @ Author Ismael Alves

FROM jenkins/jenkins

LABEL maintainer="Ismael Alves cearaismael1997@gmail.com"
ARG master_image_version="v.2.2.2"
ENV master_image_version $master_image_version

# Platforms Install
USER root
# Docker
RUN apt-get update -qq \
    && apt-get install -qqy apt-transport-https ca-certificates curl gnupg2 software-properties-common 
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
RUN add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"
RUN apt-get update  -qq \
    && apt-get install docker-ce=17.12.1~ce-0~debian -y
RUN usermod -aG docker jenkins
# Docker-compose
RUN curl -L "https://github.com/docker/compose/releases/download/1.8.1/docker-compose-$(uname -s)-$(uname -m)" > /usr/local/bin/docker-compose \
    && chmod +x /usr/local/bin/docker-compose
# Java 8 & Git
RUN apt-get install -y make git openjdk-8-jdk && rm -rf /var/lib/apt/lists/*
# Node js
RUN curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash - \
    && apt-get install -y gcc g++ make nodejs
#sshpass
RUN apt-get install sshpass
# Backup & Recover
RUN mkdir /srv/backup && chown jenkins:jenkins /srv/backup

# Plugins Install
USER jenkins
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
RUN echo clear > /usr/share/jenkins/ref/jenkins.install.UpgradeWizard.state
RUN echo clear > /usr/share/jenkins/ref/jenkins.install.InstallUtil.lastExecVersion