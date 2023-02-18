from django.urls import path
from . import views


urlpatterns = [
    path('', views.endpoints),
    path('users/', views.user_list, name='users'),
    path('users/<str:username>/', views.user_detail)
]