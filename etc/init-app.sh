#!/bin/bash
set -e

cat /etc/app/uwsgi.template | envsubst "\$UWSGI_WORKERS \$UWSGI_HOTLOAD" > /etc/app/uwsgi.ini

echo ------------------------------------------------------------
cat /etc/app/uwsgi.ini
echo ------------------------------------------------------------

if [ -f /app/requirements.txt ]; then
	pip install --upgrade -r /app/requirements.txt
fi

export PGUSER=$POSTGRES_USER
export PGPASSWORD=$POSTGRES_PASSWORD

# If no postgres password has been set, then don't wait for the database to come up
if [ -z "$PGPASSWORD" ]; then
	echo "Not waiting for database to come up."
else
	echo -n Waiting for database to come online.

	set +e
	while ! psql -c '\q' 2> /dev/null; do
		echo -n .
		sleep 1
	done
	echo -e "\nDatabase is online."
fi
