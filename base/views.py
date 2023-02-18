from django.shortcuts import render
from django.http import JsonResponse
from rest_framework.decorators import api_view
from rest_framework.response import Response

from .models import User



@api_view(['GET'])
def endpoints(request):
    data = ['/users', 'users/:username']
    return Response(data)


@api_view(['GET'])
def user_list(request):
    # data = ['Ratul', 'Intiser', 'Hasib']
    users =  User.objects.all()
    return Response(users)

@api_view(['GET'])
def user_detail(request, username):
    data = username
    return Response(data)