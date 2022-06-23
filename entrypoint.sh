#!/bin/bash
python manage.py makemigrations
python manage.py migrate
uvicorn config.asgi:application --host 0.0.0.0 --port 8000 --reload --lifespan off
