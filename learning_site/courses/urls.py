from django.conf.urls import urls

from . import views

urlpatterns = [

	path('', views.course_list),
	# path('<int:pk>', views.course_detail),
	# url(r'(?P<pk>\d+)/$', views.course_detail), 