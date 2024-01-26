#!/bin/bash

# Run database migrations or initialization tasks
echo "Running database migrations..."
python manage.py makemigrations
python manage.py migrate

# Start the development server
echo "Starting Django application..."

gunicorn core.wsgi --bind 0.0.0.0:8000 --workers 4 --threads 4
