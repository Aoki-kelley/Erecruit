from rest_framework import serializers

from .models import *


class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = (
            'id',
            'username',
            'email',
            'image'
        )


class ResumeSerializer(serializers.ModelSerializer):
    user = UserSerializer(read_only=True)

    class Meta:
        model = Resume
        fields = (
            'id',
            'user',
            'name',
            'sex',
            'major',
            'education',
            'wish_job',
            'wish_city',
            'wish_salary',
            'identity',
            'detail',
        )
