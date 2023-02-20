from django.shortcuts import render, redirect
from django.http import JsonResponse

from rest_framework.decorators import api_view, permission_classes
from rest_framework.response import Response
from rest_framework.permissions import IsAuthenticated

from django.db.models import Q

from .models import User, Company
from .serializers import UserSerializer, CompanySerializer

import requests

from rest_framework.views import APIView


from dotenv import load_dotenv
load_dotenv()
import os

TWITTER_API_KEY = os.environ.get('TWITTER_API_KEY')

@api_view(['GET'])
def endpoints(request):
    print(TWITTER_API_KEY)
    data = ['/users', 'users/:username']
    return Response(data)


@api_view(['GET', 'POST'])
# @permission_classes([IsAuthenticated])
def user_list(request):
    #Handles GET requests
    if request.method == 'GET':
        query = request.GET.get('query')
        if query == None:
            query = ''

        users =  User.objects.filter(Q(username__icontains=query)| Q(bio__icontains=query))
        serializer = UserSerializer(users, many=True)
        return Response(serializer.data)

    #Handles POST requests
    if request.method == 'POST':
        user = User.objects.create(
            username = request.data['username'],
            bio = request.data['bio']
            )
        serializer = UserSerializer(user, many=False)
        return Response(serializer.data)

# @api_view(['GET', 'PUT', 'DELETE'])
# def user_detail(request, username):
#     user = User.objects.get(username=username)

#     if request.method == 'GET':
        
#         serializer = UserSerializer(user, many=False)
#         return Response(serializer.data)

#     if request.method == 'PUT':
#         user.username = request.data['username']
#         user.bio = request.data['bio']
#         user.save()

#         serializer = UserSerializer(user, many=False)
#         return Response(serializer.data)

#     if request.method == 'DELETE':
#         user.delete()
#         return Response('users was deleted')

class UserDetails(APIView):

    def get_object(self, username):
        try:
            return User.objects.get(username=username)
        except User.DoesNotExist:
            raise JsonResponse("User doesn't exists")

    def get(self, request, username):
        head = {'Authorization': 'Bearer' + TWITTER_API_KEY }
        
        fields = '?user.fields=profile_pic_image_url,description,public_metrics'

        url = "https://api.twitter.com/2/users/by/username/" + str(username) + fields
        response = requests.get(url, headers=head).json()
        data = response['data']
        data['profile_pic_image_url'] = data['profile_pic_image_url'].replace('normal', '400x400')

        user = self.get_object(username)
        user.name = data['name'] 
        user.profile_pic = data['profile_pic_image_url'] 
        user.bio = data['description'] 
        user.social_link = 'https://twitter.com/' + username 
        user.save()
        serializer = UserSerializer(user, many=False)
        return Response(serializer.data)

    def put(self, request, username):
        user = self.get_object(username)

        user.username = request.data['username']
        user.bio = request.data['bio']
        serializer = UserSerializer(user, many=False)
        return Response(serializer.data)
    
    def delete(self, request, username):
        user = self.get_object(username)
        user.delete()
        return Response('user was deleted')
    
@api_view(['GET'])
def companies_list(request):
    companies = Company.objects.all()
    serializer = CompanySerializer(companies, many=True)
    return Response(serializer.data)

