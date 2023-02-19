from rest_framework.serializers import ModelSerializer
from .models import User, Company


class UserSerializer(ModelSerializer):
    class Meta:
        model = User
        fields = '__all__'

class CompanySerializer(ModelSerializer):
    class Meta:
        model = Company
        fields = '__all__'