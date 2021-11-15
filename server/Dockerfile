# get base image
FROM openjdk:17-jdk-oraclelinux8

# Arguments
ARG port=7000

# set the maintainer
MAINTAINER "Isaac D. Griffith"

# create working directory
WORKDIR ./

# copy components
COPY ./build/distributions/server.zip ./server.zip

# create the user so root is not running the app
#USER appuser

# Install dependencies
RUN microdnf install zip unzip -y

# install the components
RUN unzip server.zip

# expose the networking port
EXPOSE $port

# Setup the entrypoint
ENTRYPOINT ./server/bin/server