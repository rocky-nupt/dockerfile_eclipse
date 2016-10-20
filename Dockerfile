FROM ubuntu:14.04
MAINTAINER rocky

RUN echo "deb http://mirrors.163.com/ubuntu/ wily main restricted universe multiverse" > /etc/apt/sources.list
RUN echo "deb http://mirrors.163.com/ubuntu/ wily-security main restricted universe multiverse" >> /etc/apt/sources.list
RUN echo "deb http://mirrors.163.com/ubuntu/ wily-updates main restricted universe multiverse" >> /etc/apt/sources.list
RUN echo "deb http://mirrors.163.com/ubuntu/ wily-proposed main restricted universe multiverse" >> /etc/apt/sources.list
RUN echo "deb http://mirrors.163.com/ubuntu/ wily-backports main restricted universe multiverse" >> /etc/apt/sources.list
RUN echo "deb-src http://mirrors.163.com/ubuntu/ wily main restricted universe multiverse" >> /etc/apt/sources.list
RUN echo "deb-src http://mirrors.163.com/ubuntu/ wily-security main restricted universe multiverse" >> /etc/apt/sources.list
RUN echo "deb-src http://mirrors.163.com/ubuntu/ wily-updates main restricted universe multiverse" >> /etc/apt/sources.list
RUN echo "deb-src http://mirrors.163.com/ubuntu/ wily-proposed main restricted universe multiverse" >> /etc/apt/sources.list
RUN echo "deb-src http://mirrors.163.com/ubuntu/ wily-backports main restricted universe multiverse" >> /etc/apt/sources.list

RUN apt-get update -y && apt-get -y install libswt-gtk-3-java libcanberra-gtk-module

COPY eclipse-jee-neon-1a-linux-gtk-x86_64.tar.gz /eclipse/
COPY jdk-8u101-linux-x64.tar.gz /jdk/

WORKDIR /jdk/
RUN tar zxvf jdk-8u101-linux-x64.tar.gz -C /jdk/
RUN mv /jdk/jdk1.8.0_101/* /jdk && rm -rf /jdk/jdk1.8.0_101
#RUN echo "export JAVA_HOME=/jdk">>/etc/profile
#RUN echo "export CLASSPATH=${JAVA_HOME}/lib">>/etc/profile
#RUN echo "export PATH=${JAVA_HOME}/bin:$PATH">>/etc/profile

WORKDIR /eclipse/
RUN tar zxvf eclipse-jee-neon-1a-linux-gtk-x86_64.tar.gz -C /eclipse/
ADD .bashrc .
RUN chmod +x ./.bashrc
ENTRYPOINT ["./.bashrc"] 
#RUN export uid=1000 gid=1000 && \
#    mkdir -p /home/developer && \
#    echo "developer:x:${uid}:${gid}:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
#    echo "developer:x:${uid}:" >> /etc/group && \
#    echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer && \
#    chmod 0440 /etc/sudoers.d/developer && \
#    chown ${uid}:${gid} -R /home/developer

#USER developer
#ENV HOME /home/developer
#CMD /eclipse/eclipse/eclipse
