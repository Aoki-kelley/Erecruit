# Generated by Django 3.2.8 on 2022-03-08 18:01

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('company', '0003_alter_company_detail'),
    ]

    operations = [
        migrations.AlterField(
            model_name='company',
            name='img',
            field=models.FileField(default='company_image/default.bmp', upload_to='company_image', verbose_name='公司图片'),
        ),
    ]