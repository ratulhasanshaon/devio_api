from django.db import models

# Create your models here.
class Company(models.Model):
    name = models.CharField(max_length=200)
    bio = models.TextField(max_length=250, null=True, blank=True)
    
    def __str__(self):
        return self.name

class User(models.Model):
    company = models.ForeignKey(Company, on_delete=models.SET_NULL, null=True, blank=True)
    name = models.CharField(null=True,max_length=500, blank=True)
    username = models.CharField(max_length=200)
    bio = models.TextField(max_length=550, null=True, blank=True)
    stack = models.CharField(max_length=200, null=True, blank=True)
    profile_pic = models.CharField(null=True,max_length=500)
    social_link = models.URLField(null=True, blank=True)

    def __str__(self):
        return self.username