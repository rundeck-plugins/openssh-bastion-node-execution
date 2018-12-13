FROM rundeck/rundeck:SNAPSHOT

USER root

RUN apt-get -y update && \
    apt-get -y install \
    software-properties-common  \
    apt-transport-https \
    iputils-ping \
    netcat-traditional \
    unzip \
    zip

#set rundeck password
RUN echo 'rundeck:rundeck' | chpasswd

USER rundeck
ENV RDECK_BASE=/home/rundeck

RUN mkdir data

COPY --chown=rundeck:rundeck ./plugins ./libext

VOLUME ["/home/rundeck/server/data"]

EXPOSE 4440
ENTRYPOINT [ "docker-lib/entry.sh" ]