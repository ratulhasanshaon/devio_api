from django.db import models

# Create your models here.

class User(models.Model):
    username = models.CharField(max_length=200)
    bio = models.TextField(max_length=250, null=True, blank=True)

    def __str__(self):
        return self.username