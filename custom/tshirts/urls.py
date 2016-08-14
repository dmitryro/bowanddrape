from django.conf.urls import patterns, include, url
from django.contrib import admin

urlpatterns = patterns('custom.tshirts.views.customize',
    url(r'^(?P<pk>\d+)/$', 'costumize'),
    url(r'^image/$', 'costumize_image'),
    url(r'^text/$', 'costumize_text'),
    url(r'^text/(?P<color>\d+)/(?P<text>\d+)/(?P<font>\d+)$', 'submit_text'),
    url(r'^get_text/(?P<color>\w+)/(?P<context>\w.+|)/(?P<font>\w+)/(?P<submit>\w+)$', 'gen_text'),
    url(r'^get_design/(?P<pk>\d+)/$', 'gen_design'),
)

