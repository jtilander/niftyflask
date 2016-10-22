#!/bin/bash
set -e
echo "exec uwsgi --ini /etc/app/uwsgi.ini"
exec uwsgi --ini /etc/app/uwsgi.ini
