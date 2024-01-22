# Using Celery and Redis with Django to perform background task

## Project Setup and Running Guide

This guide will walk you through the setup and running process for a project that uses Celery and Redis to send emails in the background. Please note that this guide is focused on setting up the project on a Windows machine. Also, its just a demo with a basic implementation

## Prerequisites

Before starting, make sure you have the following prerequisites installed:

- Python 3.11.x
- Redis (installed on the Windows Subsystem for Linux - WSL)
    [Redis installation guide](https://redis.io/docs/install/install-redis/install-redis-on-windows/)

## Project Setup

1. Clone the project repository to your local machine.
2. Open a terminal or command prompt and navigate to the project directory.

### Setting up the Python Environment

3. Create a virtual environment for the project:
```
python -m venv env
```

4. Activate the virtual environment:
```
env\Scripts\activate
```

5. Install the project dependencies:
```
pip install -r requirements.txt
```

### Configuring Redis

6. Install Redis on the Windows Subsystem for Linux (WSL) by following the official Redis installation instructions for Ubuntu.
7. Start Redis on WSL using the default port `6379`. If you're using a different port, make sure to update the port in the project's `settings.py` file.

### Configuration

8. Rename the `.env.example` file to `.env`.
9. Open the `.env` file and update the configuration variables as needed. For example, you might need to set the `EMAIL_HOST`, `EMAIL_PORT`, and other email-related settings.

### Running the Server

10. Start the Django development server:
```
python manage.py runserver
```

11. Access the application by visiting `http://127.0.0.1:8000` in your browser.

### Running Celery with Eventlet

12. Open a new terminal or command prompt.
13. Activate the virtual environment:
```
env\Scripts\activate
```

14. Start Celery with the Eventlet pool:
```
celery -A core worker --loglevel=info -P eventlet
```

Celery should now be running and ready to process background tasks, such as sending emails.

## Conclusion

You have successfully set up the project and started the Django development server and Celery with Eventlet. The application is now ready to send emails in the background using Celery and Redis.

Remember to refer to the project's documentation for more details on how to use the application and customize it to your specific needs.

Happy coding!