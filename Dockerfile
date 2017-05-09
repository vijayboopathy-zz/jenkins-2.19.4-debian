FROM jenkins:2.19.4

MAINTAINER vijayboopathy <vibe@initcron.org>

# Change to root user to install packages
USER root

# Install Prereqs
RUN apt update -y && \
    apt-get -y install wget sudo && \
    echo "jenkins    ALL=NOPASSWD: ALL" >> /etc/sudoers

# Change to Jenkins User
USER jenkins

# Install Docker-Engine
RUN wget -qO- get.docker.io | sh && \
    sudo usermod -aG docker jenkins

# Install Docker Compose
RUN curl -L https://github.com/docker/compose/releases/download/1.12.0/docker-compose-`uname -s`-`uname -m` > ~/docker-compose && \
    chmod +x ~/docker-compose

ENTRYPOINT ["/bin/tini", "--", "/usr/local/bin/jenkins.sh"]
