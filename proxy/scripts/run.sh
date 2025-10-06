#!/bin/sh

set -e

envsubst < /etc/nginx/default.conf.tpl > /etc/nginx/conf.d/default.conf
nginx -g 'daemon off;'
python manage.py migrate

gunicorn --bind 9000 --workers 4 app.wsgi
