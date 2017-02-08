#!/bin/bash
cd /wwwroot
echo "waiting on mysql"
while ! mysqladmin ping -h"mysql" -u --silent 2>/dev/null; do
	sleep 3
	echo "..."
done
python3 manage.py migrate --noinput
python3 manage.py collectstatic --noinput
gunicorn --log-file=- --workers 4 --name impact_gunicorn -b 0.0.0.0:8000 impact.wsgi:application
