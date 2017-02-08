#!/bin/bash
cd /wwwroot
python3 manage.py migrate --noinput
python3 manage.py collectstatic --noinput
gunicorn --log-file=- --workers 4 --name impact_gunicorn -b 0.0.0.0:8000 impact.wsgi:application
