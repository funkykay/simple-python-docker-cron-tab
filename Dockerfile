FROM ubuntu:latest

RUN apt-get update && apt-get -y install cron && apt-get install -y python3 python3-pip

# Setup the Python environment
COPY ./requirements.txt /app/config/
RUN python3 -m pip install -r /app/config/requirements.txt

# Copy the source code
COPY src/ /app/src/

# Copy the cron file to the cron.d directory
COPY python-cron /etc/cron.d/python-cron

# Give execution rights on the cron job
RUN chmod 0644 /etc/cron.d/python-cron

# Apply the cron job
RUN crontab /etc/cron.d/python-cron

# Run the command on container startup
CMD ["cron", "-f"]
