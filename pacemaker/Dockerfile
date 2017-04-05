FROM ubuntu

RUN apt-get update && apt-get install -y pacemaker vim net-tools iputils-ping telnet
RUN mkdir -p /etc/corosync/service.d
RUN update-rc.d pacemaker defaults 20 01

ADD ./etc/ /docker/
ADD start.sh /docker/start.sh

# Copy configuration
RUN cp /docker/authkey /etc/corosync/authkey && \
    cp /docker/pcmk /etc/corosync/service.d/pcmk && \
    cp /docker/corosync.conf /etc/corosync/corosync.conf

#RUN usermod --shell=/bin/bash hacluster
#RUN usermod --password=$(openssl passwd r00tme) hacluster

# fix bug (run service in backgroud - &)
# RUN sed -i 's/DAEMON_ARGS > \/dev\/null 2>&1/DAEMON_ARGS \> \/dev\/null 2\>\&1 \&/' /etc/init.d/pcsd

EXPOSE 5404 5406 2224
