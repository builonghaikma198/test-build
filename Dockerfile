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
RUN sudo apt-get update && apt-get upgrade -y
RUN sudo apt install apt-transport-https ca-certificates curl software-properties-common
RUN sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
RUN sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
RUN sudo apt update
RUN sudo apt-cache policy docker-ce

#
# Install Docker to test.
RUN sudo apt install docker-ce

#
# Expose port 80
EXPOSE 80

#
# Last is the actual command to start up NGINX within our Container
CMD ["docker", "-g", "daemon off;"]