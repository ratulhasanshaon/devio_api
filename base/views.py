from django.shortcuts import render, redirect
from django.http import JsonResponse
from rest_framework.decorators import api_view
from rest_framework.response import Response
from django.db.models import Q

from .models import User
from .serializers import UserSerializer


@api_view(['GET'])
def endpoints(request):
    data = ['/users', 'users/:username']
    return Response(data)


@api_view(['GET', 'POST'])
def user_list(request):
    #Handles GET requests
    if request.method == 'GET':
        query = request.GET.get('query')
        if query == None:
            query = ''

        users =  User.objects.filter(Q(username__icontains=query)| Q(bio__icontains=query))
        serializer = UserSerializer(users, many=True)
        return Response(serializer.data)

    if request.method == 'POST':
        user = User.objects.create(
            username = request.data['username'],
            bio = request.data['bio']
            )
        serializer = UserSerializer(user, many=False)
        return Response(serializer.data)

@api_view(['GET'])
def user_detail(request, username):
    user = User.objects.get(username=username)
    serializer = UserSerializer(user, many=False)
    return Response(serializer.data)