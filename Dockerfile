FROM jenkins:2.19.4
USER root
RUN apt install -y wget sudo
USER jenkins
RUN sudo wget -qO- get.docker.com | sh \
    && sudo systemctl enable docker.service \
    && sudo usermod -aG docker jenkins \ 
    && sudo curl -L https://github.com/docker/compose/releases/download/1.12.0/docker-compose-`uname -s`-`uname -m` > ~/docker-compose \
    && sudo chmod 755 ~/docker-compose       
