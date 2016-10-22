#!/bin/bash
set -e

cat /etc/nginx/nginx.template | envsubst \$NGINX_WORKERS > /etc/nginx/nginx.conf


