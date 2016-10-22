#!/bin/bash
set -e
echo "Running nginx"
# Ensure that nginx is started and run in foreground.
exec nginx -g 'daemon off;'
