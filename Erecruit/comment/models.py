from datetime import datetime

from django.db import models


# Create your models here.



# 回复
from user.models import User


class Comment(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE, verbose_name="发表评论的用户")
    date = models.DateField(default=datetime.now, verbose_name="评论时间")
    detail = models.CharField(max_length=150, verbose_name="评论内容")
