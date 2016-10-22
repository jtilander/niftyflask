# NiftyFlask

## Introduction

(WIP)

My attempt to not rediscover all the ins and outs of bringing up a new
flask application each time.


## Usage


## Dockerfiles

There are a couple of containers in flight at the same time. 

First we have the frontend nginx proxy, this is the reverse proxy
that allows us to have multiple sites by name on the same host port 80.

Then we have the backend postgresql database. This persists.

We then have the frontend server docker image which hosts the uwsgi
processes and the nginx process that serves both the html and the api.

Finally we have a "source code only" docker container that only holds
the API source code and the HTML. This way we can either use this container
on a production server, or we can simply mount the /app volume from a 
local environment to handle a hotloading scenario.


## Environment variables



