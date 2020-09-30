FROM ubuntu:latest


LABEL maintainer="blhai@company.com.vn"


# Update the image to the latest packages
RUN apt-get update && apt-get upgrade -y
RUN apt install apt-transport-https ca-certificates curl software-properties-common -y
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable" 
RUN apt update
RUN apt-cache policy docker-ce 

#
# Install Docker to test.
RUN apt install docker-ce -y
RUN apt install software-properties-common

RUN apt update


#
# Expose port 80
EXPOSE 80

#
# Last is the actual command to start up NGINX within our Container
CMD ["docker", "-g", "daemon off;"]

RUN apt update && apt upgrade -y



