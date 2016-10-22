#!/bin/bash
#set -e

cat /etc/app/uwsgi.template | envsubst \$UWSGI_WORKERS > /etc/app/uwsgi.ini

if [ -f /app/requirements.txt ]; then
	pip install --upgrade -r /app/requirements.txt
fi