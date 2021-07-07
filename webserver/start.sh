cd /webserver
/usr/local/nginx/sbin/nginx
gunicorn -c config.py wsgi:app