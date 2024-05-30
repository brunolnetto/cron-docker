FROM ubuntu:latest

WORKDIR /app

# Install the required packages
RUN apt-get update && apt-get -y install cron

# Cron jobs
RUN echo '* * * * * echo "Hello world" >> /var/log/cron.log 2>&1' > cron-config

# Copy the crontab file to the cron.d directory
COPY cron-config /etc/cron.d/cron-config

# Give execution rights on the cron job
RUN chmod 0644 /etc/cron.d/cron-config

# Apply cron job
RUN crontab /etc/cron.d/cron-config

# Create the log file to be able to run tail
RUN touch /var/log/cron.log

# Run the command on container startup
CMD echo "starting" && echo "continuing" && (cron) \
&& echo "tailing..." && : >> /var/log/cron.log && tail -f /var/log/cron.log

