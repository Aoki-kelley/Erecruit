# Generated by Django 3.2.8 on 2022-03-20 22:34

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('user', '0002_auto_20220320_2230'),
    ]

    operations = [
        migrations.AlterField(
            model_name='verificationcode',
            name='date',
            field=models.DateTimeField(verbose_name='申请时间'),
        ),
    ]
