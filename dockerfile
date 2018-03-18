FROM ubuntu:latest
MAINTAINER Amit Sharma

RUN mkdir -p /usr/hello-cron
# Add Script file in the /usr/hello-cron directory
ADD HelloWorld.sh /usr/hello-cron/HelloWorld.sh

# Add crontab file in the cron directory
ADD crontab /etc/cron.d/hello-cron

# Give execution rights on the /usr/hello-cron directroy
#RUN chmod 0644 /usr/hello-cron
#RUN ["chmod", "+x", "/usr/hello-cron"]

# Give execution rights on the shell script
RUN chmod 0644 /usr/hello-cron/HelloWorld.sh
RUN ["chmod", "+x", "/usr/hello-cron/HelloWorld.sh"]

# Give execution rights on the cron job
RUN chmod 0644 /etc/cron.d/hello-cron

# Create the log file to be able to run tail
RUN touch /var/log/cron.log

#Install Cron
RUN apt-get update
RUN apt-get -y install cron


# Run the command on container startup
CMD cron && tail -f /var/log/cron.log
