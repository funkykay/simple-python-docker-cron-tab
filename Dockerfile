FROM ubuntu:latest

RUN apt-get update && apt-get -y install cron && apt-get install -y python3 python3-pip

# setup python environment
COPY ./requirements.txt /app/config/
RUN python3 -m pip install -r /app/config/requirements.txt

# copy source code
COPY src/ /app/src/

# Copy cron file to the cron.d directory
COPY python-cron /etc/cron.d/python-cron

# Give execution rights on the cron job
RUN chmod 0644 /etc/cron.d/python-cron

# Apply cron job
RUN crontab /etc/cron.d/python-cron

# Create the log file to be able to run tail
RUN touch /var/log/cron.log

# Run the command on container startup
CMD cron && tail -f /var/log/cron.log
