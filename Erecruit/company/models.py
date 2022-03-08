from django.db import models

# Create your models here.


# 公司
from industry.models import Industry, Education


class Company(models.Model):
    name = models.CharField(max_length=20, verbose_name="企业名")
    detail = models.CharField(max_length=5000, null=True, verbose_name="企业简介")
    applicant = models.IntegerField(default=0, verbose_name="收到简历数")
    img = models.ImageField(upload_to='company', default='RVJ4{7(3T{4`SQ5J90LX2JY.bmp', verbose_name="公司图片")


# 职位
class Profession(models.Model):
    industry = models.ForeignKey(Industry, on_delete=models.CASCADE, verbose_name="所属行业")
    company = models.ForeignKey(Company, on_delete=models.CASCADE, verbose_name="需求企业")
    salary = models.IntegerField(default=0, verbose_name="月薪")
    name = models.CharField(max_length=20, verbose_name="职业名")
    education = models.ForeignKey(Education, on_delete=models.CASCADE, verbose_name="学历")
    application = models.IntegerField(default=0, verbose_name="申请人数")
