"""
Django settings for commerce project.

Generated by 'django-admin startproject' using Django 1.9.9.

For more information on this file, see
https://docs.djangoproject.com/en/1.9/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/1.9/ref/settings/
"""

from decimal import Decimal as D
import os
import sys
from django.utils.translation import ugettext_lazy as _
from django.core.urlresolvers import reverse_lazy

from jinja2 import StrictUndefined
from oscar import OSCAR_MAIN_TEMPLATE_DIR, get_core_apps
from oscar_accounts import TEMPLATE_DIR as ACCOUNTS_TEMPLATE_DIR
from oscar.defaults import *
# Build paths inside the project like this: os.path.join(BASE_DIR, ...)
BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
location = lambda x: os.path.join(
os.path.dirname(os.path.realpath(__file__)), x)
sys.setrecursionlimit(20000)

# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/1.9/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = 'ejv_1nuejd@k=ylav0lykidsz-@drur%99sob43_9_9nvwt_-3'

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

APPEND_SLASH = True
# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True
BASE_URL = 'http://boanddrape.3dact.com'
PROFILE_IMAGE_PATH='http://boanddrape.3dact.com/static/images/user_no_avatar.png'

ALLOWED_HOSTS = ['www.googleapis.com','https://www.googleapis.com']

SCOPES = ['https://www.googleapis.com/plus/v1/people/me',
          'https://www.googleapis.com/auth/plus.me',
          'https://www.googleapis.com/auth/plus.stream.write']
VERIFY_SSL = False

# Application definition

INSTALLED_APPS = [
    'grappelli',
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.sites',
    'django.contrib.messages',
    'django.contrib.redirects',
    'django.contrib.staticfiles',
    'django.contrib.flatpages',
    'admin_tools',
    'admin_tools.menu',
    'adminsortable',
    'clear_cache',
    'django_actions',
    'django_extensions',
    'django_filters',
    'django_redis',
    'django_jinja',
    'django_jinja2',
    'jinja2',
    'favicon',
    'rest_framework',
    'rest_framework.authtoken',
    'rest_framework_digestauth',
    'rest_framework_bulk',
    'rest_framework_jwt',
    'rest_framework_oauth',
    'rest_framework_extensions',
    'rest_framework_filters',
    "pinax.stripe",
    'redis_cache',
    'redis_sessions',
    'taxonomy',
    'oscarapi',
    'custom.oscar_extensions',
    'custom.django_ocar_stripe',
    'oscar_accounts',
    'oscar_shipping',
    'oscarapicheckout',
    'oauth2_provider',
    'paypal',
    'widget_tweaks',
    'custom.tshirts',
    'custom.users',

]+get_core_apps(['custom.apps.shipping',
                 'custom.apps.checkout',
                 'custom.oscar_payments.payments',
             #    'oscarbluelight.dashboard.offers',
              #   'oscarbluelight.dashboard.vouchers',
              #   'oscarbluelight.offer',
              #   'oscarbluelight.voucher',
                ])

MIDDLEWARE_CLASSES = [
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.cache.UpdateCacheMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.auth.middleware.SessionAuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
    'django.contrib.redirects.middleware.RedirectFallbackMiddleware',
    'django_user_agents.middleware.UserAgentMiddleware',
    'django.contrib.flatpages.middleware.FlatpageFallbackMiddleware',
    'debug_toolbar.middleware.DebugToolbarMiddleware',
    'oscar.apps.basket.middleware.BasketMiddleware',
    'django.middleware.cache.FetchFromCacheMiddleware',
]

ROOT_URLCONF = 'commerce.urls'

SITE_ID=1

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': ['templates',
                 ACCOUNTS_TEMPLATE_DIR,
                 OSCAR_MAIN_TEMPLATE_DIR,],
        'APP_DIRS': False,
        'OPTIONS': {
            'loaders': [
                'admin_tools.template_loaders.Loader', 
                'django.template.loaders.filesystem.Loader',
                'django.template.loaders.app_directories.Loader',
                'django_jinja.loaders.FileSystemLoader',
                'django_jinja.loaders.AppLoader',
            ],
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.core.context_processors.debug',
                'django.core.context_processors.i18n',
                'django.core.context_processors.media',
                'django.core.context_processors.static',
                'django.core.context_processors.tz',
                'oscar.apps.search.context_processors.search_form',
                'oscar.apps.promotions.context_processors.promotions',
                'oscar.apps.checkout.context_processors.checkout',
                'oscar.apps.customer.notifications.context_processors.notifications',
                'oscar.core.context_processors.metadata',
            ],
        },
    },
]

AUTHENTICATION_BACKENDS = (
    'oscar.apps.customer.auth_backends.EmailBackend',
    'django.contrib.auth.backends.ModelBackend',
)

WSGI_APPLICATION = 'commerce.wsgi.application'


# Database
# https://docs.djangoproject.com/en/1.9/ref/settings/#databases


# Password validation
# https://docs.djangoproject.com/en/1.9/ref/settings/#auth-password-validators

AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]


# Internationalization
# https://docs.djangoproject.com/en/1.9/topics/i18n/

LANGUAGE_CODE = 'en-us'

TIME_ZONE = 'America/New_York'

USE_I18N = True

USE_L10N = True

USE_TZ = True

LANGUAGE_CODE = 'en-us'

gettext_noop = lambda s: s
LANGUAGES = (
    ('en-us', gettext_noop('American English')),
    ('zh-cn', gettext_noop('Simplified Chinese')),
    ('nl', gettext_noop('Dutch')),
    ('it', gettext_noop('Italian')),
    ('pl', gettext_noop('Polish')),
    ('ru', gettext_noop('Russian')),
    ('sk', gettext_noop('Slovak')),
    ('pt-br', gettext_noop('Brazilian Portuguese')),
    ('fr', gettext_noop('French')),
    ('de', gettext_noop('German')),
    ('ko', gettext_noop('Korean')),
    ('uk', gettext_noop('Ukrainian')),
    ('es', gettext_noop('Spanish')),
    ('da', gettext_noop('Danish')),
    ('ar', gettext_noop('Arabic')),
    ('ca', gettext_noop('Catalan')),
    ('cs', gettext_noop('Czech')),
    ('el', gettext_noop('Greek')),
)


# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/1.9/howto/static-files/

STATIC_URL = '/static/'
STATIC_ROOT = './static'
MEDIA_URL = '/media/'
MEDIA_ROOT = './media'
THUMBNAIL_DEBUG = True
THUMBNAIL_KEY_PREFIX = 'oscar-sandbox'


HAYSTACK_DEFAULT_OPERATOR = 'AND'
HAYSTACK_DEFAULT_OPERATOR = 'OR'
HAYSTACK_SEARCH_RESULTS_PER_PAGE = 50


HAYSTACK_CONNECTIONS = {
    'default': {
        'ENGINE': 'haystack.backends.simple_backend.SimpleEngine',
    },
}


DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'NAME': 'commercedb',
        'USER': 'root',
        'PASSWORD': '',
        'HOST': '',
   },
   'options' : {
        'db_table': 'gui_logo',
        'managed': False,
   },
}
ATOMIC_REQUESTS = True

GRAPPELLI_ADMIN_TITLE = 'Bow & Drape'
GRAPPELLI_CLEAN_INPUT_TYPES = True

STATICFILES_DIRS = (
  './static_files',
)


STATICFILES_FINDERS = [
    'django.contrib.staticfiles.finders.FileSystemFinder',
    'django.contrib.staticfiles.finders.AppDirectoriesFinder',
]

DEFAULT_AUTHENTICATION = (
    'rest_framework.authentication.BasicAuthentication',
    'rest_framework.authentication.SessionAuthentication',
    'rest_framework.authentication.OAuth2Authentication',
    'rest_framework.authentication.TokenAuthentication',
    'rest_framework_jwt.authentication.JSONWebTokenAuthentication',
)

REST_FRAMEWORK = {
    'DEFAULT_FILTER_BACKENDS': ('rest_framework.filters.DjangoFilterBackend',),
    'DEFAULT_AUTHENTICATION_CLASSES': (
       'rest_framework.authentication.TokenAuthentication',
       'rest_framework.authentication.BasicAuthentication',
       'rest_framework.authentication.SessionAuthentication',
     ),
    'DEFAULT_PARSER_CLASSES': (

        'rest_framework.parsers.JSONParser',
        'rest_framework.parsers.MultiPartParser',
    ),
    'DEFAULT_PERMISSION_CLASSES': (
        'rest_framework.permissions.IsAuthenticated',
    ),
    'PAGINATE_BY': 1000,

    'DEFAULT_MODEL_SERIALIZER_CLASS':
        'rest_framework.serializers.ModelSerializer',

    'TEST_REQUEST_RENDERER_CLASSES': (
        'rest_framework.renderers.MultiPartRenderer',
        'rest_framework.renderers.JSONRenderer',
        'rest_framework.renderers.TemplateHTMLRenderer'
    ),
    'DEFAULT_RENDERER_CLASSES': (
        'rest_framework.renderers.JSONRenderer',
        'rest_framework.renderers.BrowsableAPIRenderer',
    ),
}
OSCAR_ALLOW_ANON_CHECKOUT=True
OSCAR_ALLOW_ANON_REVIEWS=False


# Needed by oscarapicheckout
ORDER_STATUS_PENDING = 'Pending'
ORDER_STATUS_PAYMENT_DECLINED = 'Payment Declined'
ORDER_STATUS_AUTHORIZED = 'Authorized'

# settings.py
PINAX_STRIPE_PUBLIC_KEY = os.environ.get("STRIPE_PUBLIC_KEY", "your test public key")
PINAX_STRIPE_SECRET_KEY = os.environ.get("STRIPE_SECRET_KEY", "your test secret key")
# Other statuses
ORDER_STATUS_SHIPPED = 'Shipped'
ORDER_STATUS_CANCELED = 'Canceled'




REST_SESSION_LOGIN = False
EMAIL_BACKEND = 'django.core.mail.backends.console.EmailBackend'
EMAIL_HOST = 'smtp.gmail.com'
EMAIL_HOST_USER = 'dmitryro@gmail.com'
EMAIL_HOST_PASSWORD = 'nu45edi1'
EMAIL_PORT = 587
EMAIL_USE_TLS = True


STATICFILES_FINDERS = (
    'django.contrib.staticfiles.finders.FileSystemFinder',
    'django.contrib.staticfiles.finders.AppDirectoriesFinder',
)



#ACCOUNT_ACTIVATION_DAYS = 7 # One-week activation window; you may, of course, use a different value
OSCAR_DASHBOARD_NAVIGATION.append(
    {
        'label': 'Accounts',
        'icon': 'icon-globe',
        'children': [
            {
                'label': 'Gift Cards',
                'url_name': 'accounts-list',
            },
            {
                'label': 'Transfers',
                'url_name': 'transfers-list',
            },
            {
                'label': 'Manual Charges',
                'url_name': 'transfers-list',
            },
            {
                'label': 'Transactions',
                'url_name': 'transfers-list',
            },
            {
                'label': 'Deferred income report',
                'url_name': 'report-deferred-income',
            },
            {
                'label': 'Profit/loss report',
                'url_name': 'report-profit-loss',
            },
        ]
    }
)
OSCAR_DASHBOARD_NAVIGATION.append(
    {
        'label': 'Stripe',
        'icon': 'icon-globe',
        'children': [
            {
                'label': 'Accounts',
                'url_name': 'accounts-list',
            },
            {
                'label': 'Charge',
                'url_name': 'benefits-list',
            },
            {
                'label': 'Release from escrow',
                'url_name': 'accounts-list',
            },
            {
                'label': 'Refund',
                'url_name': 'transfers-list',
            },
            {
                'label': 'Deferred income report',
                'url_name': 'report-deferred-income',
            },
            {
                'label': 'Profit/loss report',
                'url_name': 'report-profit-loss',
            },
         ]
    }
)



OSCAR_INITIAL_ORDER_STATUS = 'Pending'
OSCAR_INITIAL_LINE_STATUS = 'Pending'
OSCAR_ORDER_STATUS_PIPELINE = {
    'Pending': ('Being processed', 'Cancelled',),
    'Being processed': ('Processed', 'Cancelled',),
    'Cancelled': (),
}

OSCAR_ORDER_STATUS_CASCADE = {
    'Being processed': 'In progress'
}

OSCAR_ALLOW_ANON_CHECKOUT=True
OSCAR_ALLOW_ANON_REVIEWS=True
SHIPPING_EVENT_STATUS_MAPPING = {
    # Translate shipping event type to OSCAR_ORDER_STATUS_PIPELINE/OSCAR_LINE_STATUS_PIPELINE
    'shipping': 'shipping',
    'delivered': 'delivered',
}



SESSION_ENGINE = 'django.contrib.sessions.backends.cache'
SESSION_ENGINE = 'redis_sessions.session'
# Example: "/home/media/media.lawrence.com/"

# URL that handles the media served from MEDIA_ROOT. Make sure to use a
# trailing slash if there is a path component (optional in other cases).
# Examples: "http://media.lawrence.com", "http://example.com/media/"

CACHES = {
    "default": {
        "BACKEND": "django_redis.cache.RedisCache",
        "LOCATION": "redis://localhost:6379/0",
        "OPTIONS": {
            "CLIENT_CLASS": "django_redis.client.DefaultClient",
        }
    },
    "redis-cache": {
        "BACKEND": "django_redis.cache.RedisCache",
        "LOCATION": 'redis://localhost:6379/1',
        "OPTIONS": {
            "CLIENT_CLASS": "django_redis.client.DefaultClient",
        }
    },
}

    # Needed by oscarapicheckout
ORDER_STATUS_PENDING = 'Pending'
ORDER_STATUS_PAYMENT_DECLINED = 'Payment Declined'
ORDER_STATUS_AUTHORIZED = 'Authorized'

    # Other statuses
ORDER_STATUS_SHIPPED = 'Shipped'
ORDER_STATUS_CANCELED = 'Canceled'

    # Pipeline Config
OSCAR_INITIAL_ORDER_STATUS = ORDER_STATUS_PENDING
OSCARAPI_INITIAL_ORDER_STATUS = ORDER_STATUS_PENDING

OSCAR_ORDER_STATUS_PIPELINE = {
        ORDER_STATUS_PENDING: (ORDER_STATUS_PAYMENT_DECLINED, ORDER_STATUS_AUTHORIZED, ORDER_STATUS_CANCELED),
        ORDER_STATUS_PAYMENT_DECLINED: (ORDER_STATUS_AUTHORIZED, ORDER_STATUS_CANCELED),
        ORDER_STATUS_AUTHORIZED: (ORDER_STATUS_SHIPPED, ORDER_STATUS_CANCELED),
        ORDER_STATUS_SHIPPED: (),
        ORDER_STATUS_CANCELED: (),
}

OSCAR_INITIAL_LINE_STATUS = ORDER_STATUS_PENDING
OSCAR_LINE_STATUS_PIPELINE = {
        ORDER_STATUS_PENDING: (ORDER_STATUS_SHIPPED, ORDER_STATUS_CANCELED),
        ORDER_STATUS_SHIPPED: (),
        ORDER_STATUS_CANCELED: (),
}

API_ENABLED_PAYMENT_METHODS = [
        {
            'method': 'oscarapicheckout.methods.Cash',
            'permission': 'oscarapicheckout.permissions.StaffOnly',
        },
        {
            'method': 'oscarapichedkout.methods.CreditCard',
            'permission': 'oscarapicheckout.permissions.Public',
        },
]

OSCAR_SHOP_TAGLINE = 'Bow & Drape'

# Add Payflow dashboard stuff to settings
OSCAR_DASHBOARD_NAVIGATION.append(
    {
        'label': 'PayPal',
        'icon': 'icon-globe',
        'children': [
            {
                'label': 'Express transactions',
                'url_name': 'paypal-express-list',
             #   'url_name': 'paypal-express-list',
            },
            {
                'label': 'PayFlow transactions',
                'url_name': 'paypal-payflow-list',
            },
        ]
    })


PAYPAL_SANDBOX_MODE = True
PAYPAL_CALLBACK_HTTPS = False
PAYPAL_API_VERSION = '119'

# These are the standard PayPal sandbox details from the docs - but I don't
# think you can get access to the merchant dashboard.
PAYPAL_API_USERNAME = 'sdk-three_api1.sdk.com'
PAYPAL_API_PASSWORD = 'QFZCWN5HZM8VBG7Q'
PAYPAL_API_SIGNATURE = 'A-IzJhZZjhg29XQ2qnhapuwxIDzyAZQ92FRP5dqBzVesOkzbdUONzmOU'

# Standard currency is GBP
PAYPAL_CURRENCY = PAYPAL_PAYFLOW_CURRENCY = 'USD'
PAYPAL_PAYFLOW_DASHBOARD_FORMS = True
PAYPAL_PAYFLOW_VENDOR_ID = 'mypaypalaccount'
PAYPAL_PAYFLOW_PASSWORD = 'asdfasdfasdf'


ACCOUNTS_UNIT_NAME = 'Giftcard'
ACCOUNTS_UNIT_NAME_PLURAL = 'Giftcards'
ACCOUNTS_MIN_LOAD_VALUE = D('30.00')
ACCOUNTS_MAX_ACCOUNT_VALUE = D('1000.00')
OSCAR_DEFAULT_CURRENCY = 'USD'

WEBSHOP_PAYMENT_CHOICES = (
    ('IDEAL', 'iDEAL'),
    ('VISA', 'Visa'),
    ('MASTERCARD', 'MasterCard'),
    ('AMEX', 'American Express'),
    ('PAYPAL_EXPRESS_CHECKOUT', 'PayPal'),  # NOTE: has additional hack in checkout code for US.
)

EMAIL_BACKEND = 'django.core.mail.backends.locmem.EmailBackend'

