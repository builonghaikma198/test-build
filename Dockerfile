# Each instruction in this file generates a new layer that gets pushed to your local image cache
#

#
# Lines preceeded by # are regarded as comments and ignored
#

#
# The line below states we will base our new image on the Latest Official Ubuntu 
FROM ubuntu:latest

#
# Identify the maintainer of an image
LABEL maintainer="blhai@company.com.vn"

#
# Update the image to the latest packages
RUN apt-get update && apt-get upgrade -y
RUN apt install apt-transport-https ca-certificates curl software-properties-common -y
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
# RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable" 
RUN apt update
RUN apt-cache policy docker-ce -y

#
# Install Docker to test.
RUN apt install docker-ce -y

#
# Expose port 80
EXPOSE 80

#
# Last is the actual command to start up NGINX within our Container
CMD ["docker", "-g", "daemon off;"]
