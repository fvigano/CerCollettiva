#!/bin/sh

# Esporta esplicitamente il modulo di configurazione di produzione
export DJANGO_SETTINGS_MODULE=cercollettiva.settings.production

# Esegui le migrazioni del database e la raccolta dei file statici (opzionale ma consigliato)
python manage.py migrate --noinput
python manage.py collectstatic --noinput

# Avvia Gunicorn passando esplicitamente il modulo di produzione
gunicorn --bind=0.0.0.0:8000 --settings=cercollettiva.settings.production cercollettiva.wsgi:application
