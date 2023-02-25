set -s

python manage.py wait_for_db
python manage.py collectstatic --noinput
python manage.py migrate

uwsgi --soket :9000 --workers 4 --master --enabe=le-threads --module app.wsgi