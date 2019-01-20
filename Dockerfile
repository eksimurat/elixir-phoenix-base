# Latest version of Erlang-based Elixir installation: https://hub.docker.com/_/elixir/
FROM elixir:alpine

LABEL maintainer="Murat Eksi"

# Add bash to the image
RUN apk add --update bash
# Add inotify to the image
RUN apk add --update inotify-tools
# Add node to the image
RUN apk add --update nodejs nodejs-npm

RUN apk add --update postgresql-client

# Configure required environment
ENV MIX_ENV dev
ENV WORKSPACE /II1305_PROJECT

# Create and set home directory
RUN mkdir $WORKSPACE
WORKDIR $WORKSPACE

# Install hex (Elixir package manager)
RUN mix local.hex --force

# Install rebar (Erlang build tool)
RUN mix local.rebar --force


# Install Phoenix
RUN mix archive.install hex phx_new 1.4.0 --force

# Copy all application files
COPY . $WORKSPACE


#CMD ["make", "all"]
