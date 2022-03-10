from rest_framework import serializers

from .models import *
from company.models import *
from industry.models import *
from comment.models import *


class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = (
            'id',
            'username',
            'email',
            'image'
        )


class CompanySerializer(serializers.ModelSerializer):
    class Meta:
        model = Company
        fields = (
            'id',
            'name',
            'detail',
            'applicant',
            'img',
        )


class IndustrySerializer(serializers.ModelSerializer):
    class Meta:
        model = Industry
        fields = (
            'id',
            'name',
            'work1',
        )


class EducationSerializer(serializers.ModelSerializer):
    class Meta:
        model = Education
        fields = (
            'id',
            'education',
        )


class ProfessionSerializer(serializers.ModelSerializer):
    industry = IndustrySerializer(read_only=True)
    company = CompanySerializer(read_only=True)
    education = EducationSerializer(read_only=True)

    class Meta:
        model = Profession
        fields = (
            'id',
            'industry',
            'company',
            'salary',
            'name',
            'education',
            'application',
        )


class ResumeSerializer(serializers.ModelSerializer):
    user = UserSerializer(read_only=True)
    education = EducationSerializer(read_only=True)

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


class WishSerializer(serializers.ModelSerializer):
    user = UserSerializer(read_only=True)
    profession = ProfessionSerializer(read_only=True)

    class Meta:
        model = Wish
        fields = (
            'id',
            'user',
            'profession',
        )


class CommentSerializer(serializers.ModelSerializer):
    user = UserSerializer(read_only=True)
    profession = ProfessionSerializer(read_only=True)

    class Meta:
        model = Comment
        fields = (
            'id',
            'user',
            'date',
            'detail',
            'profession',
        )
