from django.conf.urls import urls

from . import views

urlpatterns = [

	path('', views.course_list),
]