#!/bin/bash

cd /webserver
gunicorn -c config.py wsgi:app --daemon
/usr/local/nginx/sbin/nginx