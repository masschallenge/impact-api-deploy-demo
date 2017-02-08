from django.conf.urls import url
from django.contrib import admin
from django.views.generic import TemplateView

class Homepage(TemplateView):
    template_name = 'home.html'

urlpatterns = [
    url(r'^$', Homepage.as_view(), name='homepage'),
    url(r'^admin/', admin.site.urls),
]
