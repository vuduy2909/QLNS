import os
import pymysql
pymysql.install_as_MySQLdb()

from HRMS.settings.base import *
from HRMS.settings.base import INSTALLED_APPS
ALLOWED_HOSTS = ['localhost', '127.0.0.1','testserver']
DEBUG = True

# DATABASES = {
#     'default': {
#         'ENGINE': 'django.db.backends.sqlite3',
#         'NAME': BASE_DIR / 'db.sqlite3',
#     }
# }
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'hrms-last',  # Your database name
        'USER': 'root',  # MySQL username, you can change this if necessary
        'PASSWORD': '29092002',  # Your MySQL password
        'HOST': 'localhost',  # Or the IP of the MySQL server
        'PORT': '3306',  # Default MySQL port
    }
}

INTERNAL_IPS = ['127.0.0.1', 'localhost']
# Email Settings
EMAIL_BACKEND = "django.core.mail.backends.console.EmailBackend"
# CONTACT_SUPPORT_EMAIL = ""
LEAVE_EMAIL = "vuduynambinh@gmail.com"
DEFAULT_FROM_EMAIL = "vuduynambinh@gmail.com"
ANYMAIL = {
    "SENDGRID_API_KEY": os.environ.get("SENDGRID_API_KEY"),
}
JWT_AUTH_SECURE = False
CSRF_COOKIE_SECURE = False
SESSION_COOKIE_SECURE = False
# Cors Header Settings
CORS_ALLOW_CREDENTIALS = True
CORS_ALLOW_ALL_ORIGINS = True
CORS_ALLOWED_ORIGINS = [
    "http://localhost:3000",
    "http://localhost:8000",
    
]
CSRF_TRUSTED_ORIGINS = [
    "http://localhost:3000",
    "http://localhost:8000",
   ]
# Celery Settings
CELERY_BROKER_URL = 'redis://localhost:6379'