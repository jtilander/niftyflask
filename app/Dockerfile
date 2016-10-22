FROM ubuntu:16.04
MAINTAINER jim@tilander.org

# Ensure that the apt tool doesn't require any user interaction
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update

RUN apt-get install -qy --no-install-recommends \
    curl \
    less \
    gettext-base \
    dos2unix

# Cleanup APT when we are done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir /app
ADD ./ /app/
RUN dos2unix /app/*.py

VOLUME /app

ENTRYPOINT ["/bin/true"]
