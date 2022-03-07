import datetime
import uuid

from django.core.mail import send_mail
from django.conf import settings

from celery import Task

from user.models import VerificationCode


class SendEmailTask(Task):
    def run(self, email, label='register'):
        code = str(uuid.uuid1())[0:5].upper()
        target = VerificationCode.objects.filter(email__exact=email)
        if target:
            target.delete()
        date = datetime.datetime.now()
        VerificationCode.objects.create(email=email, code=code,
                                        date=date, action=label)
        subject = '邮箱验证'
        message = '尊敬的用户，{action}，你的验证码为{code}，请在五分钟内进行验证。\n请不要回复该邮件。'
        if label == 'register':
            message = message.format(action='欢迎你的注册', code=code)
        elif label == 'login':
            message = message.format(action='你正在进行登录操作', code=code)
        sender = settings.EMAIL_FROM
        receiver = [email]
        send_mail(subject, message, sender, receiver)
        return code, date
