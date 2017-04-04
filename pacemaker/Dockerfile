FROM ubuntu

RUN apt-get update && apt-get install -y pacemaker corosync fence-agents vim net-tools iputils-ping
RUN mkdir -p /etc/corosync/service.d
RUN update-rc.d pacemaker defaults 20 01

ADD ./etc/ /docker/
ADD start.sh /docker/start.sh

# Copy configuration
RUN cp /docker/authkey /etc/corosync/authkey && \
    cp /docker/pcmk /etc/corosync/service.d/pcmk && \
    cp /docker/corosync.conf /etc/corosync/corosync.conf

EXPOSE 5404 5406
