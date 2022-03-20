# Generated by Django 3.2.8 on 2022-03-20 22:30

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('user', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='user',
            name='image',
            field=models.FileField(default='user_image/default.png', upload_to='user_image', verbose_name='头像'),
        ),
        migrations.AlterField(
            model_name='verificationcode',
            name='date',
            field=models.DateField(verbose_name='申请时间'),
        ),
    ]
