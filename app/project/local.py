# Overrides
from .settings import *  # noqa: F401
import os
import environ

env = environ.Env(
    # set casting, default value
    DEBUG=(bool, False)
)

# Set the project base directory
BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

# Take environment variables from .env file
environ.Env.read_env(os.path.join(BASE_DIR, '.env'))

# Basic
DEBUG = env('DEBUG', default=False)
SECRET_KEY = env('SECRET_KEY', default='default')

# Database
DATABASE_ENGINE = env('DATABASE_ENGINE', default='')
DATABASE_NAME = env('DATABASE_NAME', default='')
DATABASE_USERNAME = env('DATABASE_USERNAME', default='')
DATABASE_PASSWORD = env('DATABASE_PASSWORD', default='')
DATABASE_HOST = env('DATABASE_HOST', default='')
DATABASE_PORT = env('DATABASE_PORT', default='')

DATABASES = {
    'default': {
        'NAME': DATABASE_NAME ,
        'ENGINE': DATABASE_ENGINE,
        'USER': DATABASE_USERNAME,
        'PASSWORD': DATABASE_PASSWORD,
        'HOST': DATABASE_HOST,
        'PORT': DATABASE_PORT,
    },
}

EMAIL_BACKEND = 'django.core.mail.backends.console.EmailBackend'

# TODO-specific settings
TODO_STAFF_ONLY = False
TODO_DEFAULT_LIST_SLUG = 'tickets'
TODO_DEFAULT_ASSIGNEE = None
TODO_PUBLIC_SUBMIT_REDIRECT = '/'