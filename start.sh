kill -9 $(pidof uwsgi)
cd /var/www/vhosts/bowanddrape.3dact.com/commerce
uwsgi --socket :8005 --module commerce.wsgi --emperor /etc/uwsgi/vassals --uid root --gid root  --master --processes 4 --threads 2 --stats 127.0.0.1:9292 --daemonize=/var/www/vhosts/bowanddrape.3dact.com/logs/uwsgi.log
