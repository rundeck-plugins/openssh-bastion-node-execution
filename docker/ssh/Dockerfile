FROM ubuntu:bionic
# latest LTS

RUN apt-get -y update && \
    apt-get -y install sudo  && \
    apt-get -y install openssh-server && \
    apt-get -y install \
        unzip \
        curl \
        xmlstarlet \
        git \
        netcat-traditional \
        uuid-runtime \
        ncurses-bin \
        iputils-ping \
        net-tools \
        jq \
        zip \
        python \
        wget \
        python-requests \
        libjson-maybexs-perl \
        libyaml-perl

RUN mkdir /var/run/sshd
RUN mkdir /dod-configuration

RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

COPY setup /tmp/setup

RUN /tmp/setup/mk_rundeck_user

COPY rdeck_ssh_start /usr/local/sbin

EXPOSE 22

# CMD /usr/sbin/sshd -e -D
CMD /usr/local/sbin/rdeck_ssh_start
