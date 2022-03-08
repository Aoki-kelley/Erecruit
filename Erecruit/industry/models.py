from django.db import models


# Create your models here.


# 学历


class Education(models.Model):
    education = models.CharField(max_length=30, verbose_name="学历",
                                 choices=(
                                     ('undergraduate', "本科"),
                                     ('junior_college', "大专"),
                                     ('technical_secondary', "中专"),
                                     ('high_school', "初中"),
                                     ('higher_school', '高中'),
                                     ("primary_school", "小学"),
                                     ('no_education', "无学历"),
                                 ))


# 行业
class Industry(models.Model):
    name = models.CharField(max_length=20, verbose_name="行业名")
    work1 = models.CharField(max_length=600, null=True, verbose_name="职业名")


# 所有职位
class Work(models.Model):
    industry = models.ForeignKey(Industry, on_delete=models.CASCADE, verbose_name="所属行业")
    demand = models.IntegerField(default=0, verbose_name="需求企业数")
    name = models.CharField(max_length=20, default='error', verbose_name="名字")  # 补充添加必须要有默认值，因此才加的默认值
