from datetime import datetime

from django.db import models

# Create your models here.



# 用户
from company.models import Profession
from industry.models import Education


class User(models.Model):
    username = models.CharField(max_length=10, verbose_name="用户名")
    email = models.EmailField(verbose_name="用户邮箱")


# 收藏
class Wish(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE, verbose_name="用户")
    profession = models.ForeignKey(Profession, on_delete=models.CASCADE, verbose_name="收藏的职位")


# 简历
class Resume(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE, verbose_name="用户")
    name = models.CharField(max_length=10, verbose_name="姓名")
    sex = models.CharField(max_length=10, verbose_name="性别",
                           choices=(
                               ('man', "男"),
                               ('woman', "女"),
                           ))
    majior = models.CharField(max_length=15, verbose_name="专业")
    education = models.ForeignKey(Education, on_delete=models.CASCADE, verbose_name="学历")
    wish_job = models.CharField(max_length=20, verbose_name="期望的工作")
    wish_city = models.CharField(max_length=20, verbose_name="期望的城市")
    wish_salary = models.CharField(max_length=20, verbose_name="期望的薪资")
    identity = models.CharField(max_length=10, verbose_name="身份",
                                choices=(
                                    ('schooling', "在校生"),
                                    ('graduate', '毕业生'),

                                    ('working', "职场人士"),
                                ))
    detail = models.CharField(max_length=200, null=True, verbose_name="个人简介")


# 验证码
class VerificationCode(models.Model):
    email = models.EmailField(verbose_name="用户邮箱")
    code = models.CharField(max_length=6, verbose_name="验证码")
    date = models.DateField(default=datetime.now, verbose_name="申请时间")
    action = models.CharField(max_length=10, verbose_name="用途",
                              choices=(
                                  ('register', "注册"),
                                  ('find_back', "找回"),
                              ))


# 简历记录
class Record(models.Model):
    profession = models.ForeignKey(Profession, on_delete=models.CASCADE, verbose_name="投放简历的职业")
    resume = models.ForeignKey(Resume, on_delete=models.CASCADE, verbose_name="简历")
    user = models.ForeignKey(User, on_delete=models.CASCADE, verbose_name="用户")
    status = models.CharField(max_length=20, verbose_name="简历状态",
                              choices=(
                                  ('accepted', "简历被接受"),
                                  ('failed', "被拒绝"),
                                  ('unclear', "结果未出"),
                              ))
