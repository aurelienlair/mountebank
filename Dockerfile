FROM node:lts-alpine
MAINTAINER Aurélien Lair (aurelien.lair@nomail.com)

# Tells Docker to expose this port which will be used
EXPOSE 5959

WORKDIR /usr/src/app

# Defined in .env file
ARG MOUNTEBANK_VERSION

# Set -e : exit immediately if a command exits with a non-zero status
# Set -x : print commands and their arguments as they are executed
RUN set -ex; \
    apk add --no-cache \
        --update nodejs \
        # By default, npm install will install all modules listed as dependencies in package.json.
        # With the --production flag (or when the NODE_ENV environment variable is set to production), npm will
        # not install modules listed in devDependencies.
    && npm install -g mountebank@${MOUNTEBANK_VERSION} --production


COPY . /usr/src/app

# The command that runs when the container starts
CMD [ "mb", "--configure imposter.js --loglevel debug --debug --nologfile" ]
