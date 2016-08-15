"""clmmerce URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.9/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import include
from django.conf.urls import url
from django.contrib import admin
#from oscar.accounts.views import AccountBalanceView
from oscar_accounts.dashboard.app import application as accounts_app
from oscarapi.app import application as oscar_api
from oscarapicheckout.app import application as oscar_api_checkout
from oscar.app import application
from django.conf import settings
from django.conf.urls.static import static
from oscar_accounts.views import AccountBalanceView
from paypal.express.dashboard.app import application as paypal_application
from paypal.payflow.dashboard.app import application as payflow

urlpatterns = [
    url(r'^i18n/', include('django.conf.urls.i18n')),
    url(r'^admin/', admin.site.urls),
    url(r'^grappelli/', include('grappelli.urls')), # grappelli URLS
    url(r'^dashboard/stripe/', include(accounts_app.urls)),
    url(r'^giftcard-balance/', AccountBalanceView.as_view()),
            # Conditions
 #   url(r'^giftcard-balance/', AccountBalanceView.as_view(),
  #      name="account-balance"),
    # urls.py
    url(r'^admin_tools/', include('admin_tools.urls')),
    url(r"^payments/", include("pinax.stripe.urls")),
    url(r'^pages/', include('django.contrib.flatpages.urls')),

    url(r'^api-auth/', include('rest_framework.urls', namespace='rest_framework')),
    url(r'^dashboard/accounts/', include(accounts_app.urls)),
    url(r'^checkout/paypal/', include('paypal.express.urls')),
    url(r'^dashboard/paypal/express/', include(paypal_application.urls)),
    url(r'^dashboard/paypal/payflow/', include(payflow.urls)),
    url(r'^ocapi/', include(oscar_api_checkout.urls)), # Must be before oscar_api.urls
    url(r'^ocapi/', include(oscar_api.urls)),
    url(r'', include(application.urls)),
]+ static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
