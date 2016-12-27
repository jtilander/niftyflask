#!/bin/bash
#set -e

cat /etc/app/uwsgi.template | envsubst "\$UWSGI_WORKERS \$UWSGI_HOTLOAD" > /etc/app/uwsgi.ini

echo ------------------------------------------------------------
cat /etc/app/uwsgi.ini
echo ------------------------------------------------------------

if [ -f /app/requirements.txt ]; then
	pip install --upgrade -r /app/requirements.txt
fi


export PGUSER=$POSTGRES_USER
export PGPASSWORD=$POSTGRES_PASSWORD

echo -n Waiting for database to come online.
#while ! psql -lqt 2> /dev/null; do
while ! psql -c '\q' 2> /dev/null; do
	echo -n .
	sleep 1
done
echo -e "\nDatabase is online."
