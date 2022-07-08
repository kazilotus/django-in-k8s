#!/bin/sh
set -e

if [ "$1" = 'runserver' ]; then

    until psql postgres://$DATABASE_USERNAME:$DATABASE_PASSWORD@$DATABASE_HOST/$DATABASE_NAME -c '\l'; do
        >&2 echo "Postgres is unavailable - sleeping"
        sleep 1
    done

    >&2 echo "Postgres is up - continuing"

    pipenv run env

    if [ "$DJANGO_MANAGEPY_MAKEMIGRATION" = 1 ]; then
        pipenv run ./manage.py makemigrations
    fi

    if [ "$DJANGO_MANAGEPY_MIGRATE" = 1 ]; then
        pipenv run ./manage.py migrate --noinput
    fi

    if [ "$DJANGO_MANAGEPY_COLLECTSTATIC" = 1 ]; then
        pipenv run ./manage.py collectstatic --noinput
    fi

    exec pipenv run ./manage.py runserver 0.0.0.0:80
else
    exec "$@"
fi