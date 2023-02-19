from django.urls import path
from . import views


urlpatterns = [
    path('', views.endpoints),
    path('users/', views.user_list, name='users'),
    # path('users/<str:username>/', views.user_detail)
    path('users/<str:username>/', views.UserDetails.as_view()),
    # companies
    #path('users/<str:username>/', views.UserDetails.as_view())
    path('companies/', views.companies_list)

]