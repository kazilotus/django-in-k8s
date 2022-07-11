#!/bin/sh
set -e

if [ "$1" = 'init' ] || [ "$INIT" = true ]; then

    until psql postgres://$DATABASE_USERNAME:$DATABASE_PASSWORD@$DATABASE_HOST/$DATABASE_NAME -c '\l'; do
        >&2 echo "Postgres is unavailable - sleeping"
        sleep 1
    done

    >&2 echo "Postgres is up - continuing"

    pipenv run python manage.py makemigrations
    pipenv run python manage.py migrate --noinput
    pipenv run python manage.py collectstatic --noinput

fi

if [ "$1" = 'init' ]; then return
elif [ "$1" = 'runserver' ]; then

    exec pipenv run python manage.py runserver 0.0.0.0:80

elif [ "$1" = 'supervisord' ]; then

    exec pipenv run supervisord -n -c supervisord.conf

else

    exec "$@"
    
fi