from django.conf.urls import url

from . import views


urlpatterns = [

    url(r'^logout/', views.LogoutUser.as_view(), name='logout_user'),
    url(r'^', views.FrontPage.as_view(), name='frontpage'),
]
