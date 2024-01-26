#!/bin/bash
# Base image
FROM python:3.11.4

# Set working directory
WORKDIR /app

RUN pip install --upgrade pip
RUN pip install gunicorn
ADD ./requirements.txt /app/
RUN pip install -r requirements.txt

ADD . /app/ 

RUN python manage.py collectstatic --noinput

ADD ./server-entrypoint.sh /app/
ADD ./worker-entrypoint.sh /app/

RUN chmod +x /app/server-entrypoint.sh
RUN chmod +x /app/worker-entrypoint.sh
