FROM ubuntu:focal-20210119

# setup ubuntu
RUN apt-get update && \
    apt-get install -y cron && \
    apt-get install -y python3 python3-pip && \
    apt-get install -y time && \
    apt-get install -y bc

# setup python environment
COPY ./requirements.txt /app/config/
RUN python3 -m pip install -r /app/config/requirements.txt

# copy cron job file and install it to crontab
COPY python-cron /etc/cron.d/python-cron
RUN chmod 0644 /etc/cron.d/python-cron
RUN crontab /etc/cron.d/python-cron

# copy source code
COPY src/ /app/src/
# COPY resources/ /app/resources/

# install scripts to system
COPY scripts/ /bin/
RUN chmod +x /bin/logging /bin/container_init /bin/cron_runner


CMD container_init && cron -f
