from django.conf.urls import include, url
from django.contrib import admin

from homepage import urls as homepage_urls

urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r'^', include(homepage_urls)),
]
