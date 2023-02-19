from django.urls import path
from . import views
from rest_framework_simplejwt.views import (
    TokenObtainPairView,
    TokenRefreshView,
)


urlpatterns = [
    path('', views.endpoints),

    path('token/', TokenObtainPairView.as_view(), name='token_obtain_pair'),


    path('users/', views.user_list, name='users'),
    # path('users/<str:username>/', views.user_detail)
    path('users/<str:username>/', views.UserDetails.as_view()),
    # companies
    #path('users/<str:username>/', views.UserDetails.as_view())
    path('companies/', views.companies_list)

]