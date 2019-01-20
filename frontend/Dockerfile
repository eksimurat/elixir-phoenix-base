# Latest version of Erlang-based Elixir installation: https://hub.docker.com/_/elixir/
FROM node:11.4-alpine

LABEL maintainer="Murat Eksi"

# Add bash to the image
RUN apk add --update bash
# Add inotify to the image
RUN apk add --update inotify-tools
# Add node to the image
RUN apk add --update nodejs yarn



# Configure required environment
ENV WORKSPACE /frontend



# Create and set home directory
RUN mkdir $WORKSPACE
WORKDIR $WORKSPACE

# add `/frontend/node_modules/.bin` to $PATH
ENV PATH /frontend/node_modules/.bin:$PATH


COPY package.json /frontend/package.json
#RUN yarn global add @vue/cli
# Copy all application files
#COPY . $WORKSPACE
 ADD . /frontend/