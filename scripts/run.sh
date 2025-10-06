#!/bin/sh

set -e

python manage.py wait_for_db
python manage.py collectstatic --noinput
python manage.py migrate

gunicorn --bind 0.0.0.0:9000 --workers 4 app.wsgi
