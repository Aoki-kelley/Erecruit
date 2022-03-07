import re
import simplejson

from .models import *
from django.views.generic import View
from django.http import JsonResponse

# Create your views here.
from user.tasks import SendEmailTask


def check_email(email: str) -> bool:
    """
    正则匹配email，错误返回False，正确返回True
    """
    if re.match(r'^[0-9a-zA-Z_]{0,19}@[0-9a-zA-Z]{1,13}\.[com,cn,net]{1,3}$', email):
        return True
    else:
        return False


# 注册(POST) 待测试
class Register(View):
    """
    根据前端返回的登录者的email，在验证码表中查找
    若符合，code=2000;否则code=4040
    """

    def post(self, req):
        """
        根据前端返回的登录者的email，在验证码表中查找
        若符合，User,Resume新建，code=2000;否则code=4040
        """
        rep = {
            'code': 0,
            'msg': ''
        }
        get_data = simplejson.loads(req.body)
        email = get_data['email']
        name = get_data['name']
        sex = get_data['sex']
        education = get_data['education']
        identity = get_data['identity']
        major = get_data['major']
        wish_job = get_data['wish_job']
        wish_city = get_data['wish_job']
        wish_salary_max = get_data['wish_salary_max']
        wish_salary_min = get_data['wish_salary_min']
        edu = Education.objects.filter(education=education)
        if wish_salary_min >= wish_salary_max:
            rep['code'] = 4040
            rep['msg'] = u'期望薪资最小值大于最大值'
            return JsonResponse(rep)
        if edu is None:
            rep['code'] = 4040
            rep['msg'] = u'意料外的错误导致注册失败，请稍后重试\n提示：学历填写有误'
            return JsonResponse(rep)
        if check_email(email):
            try:
                target = VerificationCode.objects.filter(email__exact=email, action='register')[0]
            except IndexError:
                rep['code'] = 4040
                rep['msg'] = u'意料外的错误导致注册失败，请稍后重试\n提示：无法找到注册请求的邮箱'
                return JsonResponse(rep)
            try:
                User.objects.create(username=email.spilt('.')[0], email=email)
                Resume.objects.create(name=name, sex=sex, education=edu, identity=identity,
                                      major=major, wish_job=wish_job, wish_city=wish_city,
                                      wish_salary_min=wish_salary_min, wish_salary_max=wish_salary_max)
            except():
                rep['code'] = 4040
                rep['msg'] = u'意料外的错误导致注册失败，请稍后重试\n提示：创建用户失败'
                return JsonResponse(rep)
            target.delete()
            rep['code'] = 2000
            rep['msg'] = u'注册成功'
        else:
            rep['code'] = 4040
            rep['msg'] = u'邮箱格式不正确'
        return JsonResponse(rep)


# 登录(POST) 已完成
class Login(View):
    def post(self, req):
        """
        根据前端返回的登录者的email，在验证码表中查找
        若符合，设置session,code=2000;否则code=4040
        """
        rep = {
            'code': 0,
            'msg': ''
        }
        email = req.POST.get('email')
        if check_email(email):
            try:
                target = VerificationCode.objects.filter(email__exact=email, action='login')[0]
            except IndexError:
                rep['code'] = 4040
                rep['msg'] = u'意料外的错误导致登录失败，请稍后重试'
                return JsonResponse(rep)
            target.delete()
            req.session['is_login'] = True
            req.session.set_expiry(86400)
            rep['code'] = 2000
            rep['msg'] = u'登录成功'
        else:
            rep['code'] = 4040
            rep['msg'] = u'邮箱格式不正确'
        return JsonResponse(rep)


# 个人主页(GET)
class HomePage(View):
    pass


# 用户名更改(PUT)
class ResetName(View):
    pass


# 个人简历(GET,PUT)
class MineResume(View):
    pass


# 个人收藏职位(GET,DEL)
class WishProfession(View):
    pass


# 个人评论(GET,DEL)
class MineComment(View):
    pass


# 发送邮件验证码(GET) 已完成
class SendCode(View):
    def get(self, req):
        """
        根据前端返回的email和url参数action在验证码表中新增数据并将验证码(captcha)和发送时间(date)返回
        处理成功,code=2000，否则code=4040
        """
        action = req.GET.get('action')
        get_data = simplejson.loads(req.body)
        email = get_data['email']
        print('请求发送验证码,action={0},email={1}'.format(action, email))
        rep = {
            'code': 0,
            'msg': '',
        }
        if check_email(email):
            try:
                send_task = SendEmailTask()
                captcha, date = send_task.run(email, label=action)
                rep['code'] = 2000
                rep['msg'] = u'验证码发送成功，请在五分钟内填写'
                rep['data'] = {'captcha': captcha, 'date': date}
            except():
                rep['code'] = 4040
                rep['msg'] = u'验证码发送失败，请稍后重试'
                return JsonResponse(rep)
        else:
            rep['code'] = 4040
            rep['msg'] = u'邮箱格式不正确'
        return JsonResponse(rep)
