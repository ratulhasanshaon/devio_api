from rest_framework.serializers import ModelSerializer, SerializerMethodField
from .models import User, Company


class CompanySerializer(ModelSerializer):
    employee_count = SerializerMethodField(read_only = True)
    class Meta:
        model = Company
        fields = '__all__'

    def get_employee_count(self,obj):
        count = obj.user_set.count()
        return count

class UserSerializer(ModelSerializer):
    company = CompanySerializer()
    class Meta:
        model = User
        fields = ['name','username', 'bio', 'stack', 'company', 'profile_pic', 'social_link']
        # fields = '__all__'

