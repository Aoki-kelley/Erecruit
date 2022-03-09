import re
import simplejson

from . import serializers
from .models import *
from django.views.generic import View
from django.http import JsonResponse

# Create your views here.
from user.tasks import SendEmailTask


def check_email(email: str) -> bool:
    """
    正则匹配email，错误返回False，正确返回True
    """
    if re.match(r'^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$', email):
        return True
    else:
        return False


# 注册(POST) 已完成
class Register(View):
    # noinspection PyMethodMayBeStatic
    def post(self, req):
        """
        根据前端返回的登录者的email，在验证码表中查找
        若符合，User,Resume新建，code=2000;否则code=4040
        """
        rep = {
            'code': 0,
            'msg': ''
        }
        email = req.POST.get('email')
        name = req.POST.get('name')
        sex = req.POST.get('sex')
        education = req.POST.get('education')
        identity = req.POST.get('identity')
        major = req.POST.get('major')
        wish_job = req.POST.get('wish_job')
        wish_city = req.POST.get('wish_job')
        wish_salary_max = req.POST.get('wish_salary_max')
        wish_salary_min = req.POST.get('wish_salary_min')
        edu = Education.objects.filter(education__exact=education)
        if wish_salary_min >= wish_salary_max:
            rep['code'] = 4040
            rep['msg'] = u'期望薪资最小值大于等于最大值'
            return JsonResponse(rep)
        if identity not in ('schooling', 'graduate', 'working'):
            rep['code'] = 4040
            rep['msg'] = u'意料外的错误导致注册失败，请稍后重试\n提示：身份填写有误'
            return JsonResponse(rep)
        if not edu:
            rep['code'] = 4040
            rep['msg'] = u'意料外的错误导致注册失败，请稍后重试\n提示：学历填写有误'
            return JsonResponse(rep)
        if check_email(email):
            try:
                target = VerificationCode.objects.filter(email__exact=email, action='register')[0]
            except IndexError as e:
                print('出现错误', repr(e))
                rep['code'] = 4040
                rep['msg'] = u'意料外的错误导致注册失败，请稍后重试\n提示：无法找到注册请求的邮箱'
                return JsonResponse(rep)
            try:
                wish_salary = str(wish_salary_min) + 'k-' + str(wish_salary_max) + 'k'
                User.objects.create(username=email.split('.')[0][0:10], email=email)
                user = User.objects.filter(email__exact=email)[0]
                Resume.objects.create(user=user, name=name, sex=sex, education=edu[0], identity=identity,
                                      major=major, wish_job=wish_job, wish_city=wish_city,
                                      wish_salary=wish_salary)
            except Exception as e:
                print('出现错误', repr(e))
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
    # noinspection PyMethodMayBeStatic
    def post(self, req):
        """
        根据前端返回的登录者的email，在验证码表中查找
        若符合，设置session,code=2000,返回user;否则code=4040
        """
        rep = {
            'code': 0,
            'msg': ''
        }
        email = req.POST.get('email')
        if check_email(email):
            try:
                target = VerificationCode.objects.filter(email__exact=email, action='login')[0]
                user = User.objects.filter(email__exact=email)[0]
                serializer = serializers.UserSerializer(user)
            except Exception as e:
                print('出现错误', repr(e))
                rep['code'] = 4040
                rep['msg'] = u'意料外的错误导致登录失败，请稍后重试'
                return JsonResponse(rep)
            target.delete()
            req.session['is_login'] = True
            req.session.set_expiry(86400)
            rep['code'] = 2000
            rep['msg'] = u'登录成功'
            rep['data']['user'] = serializer.data
        else:
            rep['code'] = 4040
            rep['msg'] = u'邮箱格式不正确'
        return JsonResponse(rep)


# 个人主页(GET)  已完成
class HomePage(View):
    # noinspection PyMethodMayBeStatic
    def get(self, req):
        """
        根据前端返回的用户id，查询用户，并判断当前登录的是否为本人
        """
        uid = req.GET.get('id')
        rep = {
            'code': 0,
            'msg': ''
        }
        is_login = req.session.get('is_login', None)
        try:
            user = User.objects.filter(id=uid)[0]
            serializer = serializers.UserSerializer(user)
        except Exception as e:
            print('出现错误', repr(e))
            rep['code'] = 4040
            rep['msg'] = u'查询的id不存在'
            return JsonResponse(rep)
        rep['code'] = 2000
        rep['msg'] = u'获取成功'
        rep['data'] = dict()
        rep['data']['user'] = serializer.data
        if is_login is True:
            rep['data']['is_oneself'] = True
        else:
            rep['data']['is_oneself'] = False
        return JsonResponse(rep)


# 用户名更改(PUT)
class ResetName(View):
    # noinspection PyMethodMayBeStatic
    def put(self, req):
        """
        根据前端返回的用户id和新用户名，更改用户的用户名
        """
        rep = {
            'code': 0,
            'msg': ''
        }
        get_data = simplejson.loads(req.body)
        uid = get_data['id']
        new_name = get_data['new_name']
        try:
            user = User.objects.filter(id=uid)[0]
        except Exception as e:
            print('出现错误', repr(e))
            rep['code'] = 4040
            rep['msg'] = u'查询的id不存在'
            return JsonResponse(rep)
        try:
            user.username = new_name
            user.save()
        except Exception as e:
            print('出现错误', repr(e))
            rep['code'] = 4040
            rep['msg'] = u'修改失败，用户名可能过长'
            return JsonResponse(rep)
        rep['code'] = 2000
        rep['msg'] = u'修改成功'
        return JsonResponse(rep)


# 个人简历(GET,PUT) GET测完
class MineResume(View):
    # noinspection PyMethodMayBeStatic
    def get(self, req):
        uid = req.GET.get('id')
        rep = {
            'code': 0,
            'msg': ''
        }
        try:
            user = User.objects.filter(id=uid)[0]
            resume = Resume.objects.filter(user_id=user.id)[0]
            serializer = serializers.ResumeSerializer(resume)
        except Exception as e:
            print('出现错误', repr(e))
            rep['code'] = 4040
            rep['msg'] = u'查询的用户或简历不存在'
            return JsonResponse(rep)
        rep['code'] = 2000
        rep['msg'] = u'查询成功'
        rep['data'] = dict()
        rep['data']['resume'] = serializer.data
        return JsonResponse(rep)

    def put(self, req):
        pass


# 个人收藏职位(GET,DEL)
class WishProfession(View):
    pass


# 个人评论(GET,DEL)
class MineComment(View):
    pass


# 发送邮件验证码(GET) 已完成
class SendCode(View):
    # noinspection PyMethodMayBeStatic
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
            except Exception as e:
                print('出现错误', repr(e))
                rep['code'] = 4040
                rep['msg'] = u'验证码发送失败，请稍后重试'
                return JsonResponse(rep)
        else:
            rep['code'] = 4040
            rep['msg'] = u'邮箱格式不正确'
        return JsonResponse(rep)
