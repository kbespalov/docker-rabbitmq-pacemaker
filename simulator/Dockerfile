FROM python

RUN apt-get update && apt-get install -y sshpass openssh-client
RUN pip install oslo.messaging influxdb pyyaml

COPY ./bash/* /messaging/
COPY ./etc/* /messaging/
COPY ./python/* /messaging/

RUN ls -la ./messaging
