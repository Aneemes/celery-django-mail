#!/bin/bash

echo "Starting celery worker..."
# Run a worker
celery -A core worker --loglevel=info --concurrency 1 -E