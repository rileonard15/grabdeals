from django.conf.urls import url

from . import views


urlpatterns = [

    url(r'^order/', views.OrderApiHandler.as_view(), name='order-product'),
    url(r'^user/login/', views.AppLogin.as_view(), name='user-login'),
    url(r'^products/(?P<pcode>\w+)/$', views.ProductInfo.as_view(), name='product-info'),

]
