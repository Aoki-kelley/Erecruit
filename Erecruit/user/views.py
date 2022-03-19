import re
import simplejson

from . import serializers
from .models import *
from comment.models import *
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
        wish_salary_max = int(req.POST.get('wish_salary_max'))
        wish_salary_min = int(req.POST.get('wish_salary_min'))
        edu = Education.objects.filter(education__exact=education)
        wrong_flag = 0
        wrong_message = []
        if sex not in ('man', 'woman'):
            wrong_message.append('性别填写有误')
            wrong_flag += 1
        if wish_salary_min >= wish_salary_max:
            wrong_message.append('期望薪资填写有误')
            wrong_flag += 1
        if identity not in ('schooling', 'graduate', 'working'):
            wrong_message.append('身份信息填写有误')
            wrong_flag += 1
        if not edu:
            wrong_message.append('学历填写有误')
            wrong_flag += 1
        if wrong_flag != 0:
            for i in range(wrong_flag):
                if i == wrong_flag - 1:
                    wrong_message[i] += '。'
                else:
                    wrong_message[i] += '，'
            rep['code'] = 4040
            rep['msg'] = u'填写的信息有误，请修改后重试\n提示：'
            for i in range(wrong_flag):
                rep['msg'] += wrong_message[i]
            return JsonResponse(rep)
        else:
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

    def http_method_not_allowed(self, request, *args, **kwargs):
        rep = {
            'code': 4040,
            'msg': 'http请求方式错误，应为POST'
        }
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
            req.session['uid'] = user.id
            req.session.set_expiry(86400)
            rep['code'] = 2000
            rep['msg'] = u'登录成功'
            rep['data'] = dict()
            rep['data']['user'] = serializer.data
        else:
            rep['code'] = 4040
            rep['msg'] = u'邮箱格式不正确'
        return JsonResponse(rep)

    def http_method_not_allowed(self, request, *args, **kwargs):
        rep = {
            'code': 4040,
            'msg': 'http请求方式错误，应为POST'
        }
        return JsonResponse(rep)


# 退出登录(GET) 已完成
class Logout(View):
    # noinspection PyMethodMayBeStatic
    def get(self, req):
        """
        删除session
        """
        rep = {
            'code': 0,
            'msg': ''
        }
        try:
            req.session.delete('uid')
        except Exception as e:
            print('出现错误', repr(e))
            rep['code'] = 4040
            rep['msg'] = u'操作失败'
            return JsonResponse(rep)
        rep['code'] = 2000
        rep['msg'] = u'登出成功'
        return JsonResponse(rep)


# 个人主页(GET)  已完成
class HomePage(View):
    # noinspection PyMethodMayBeStatic
    def get(self, req):
        """
        根据前端返回的用户id，查询用户，并判断当前登录的是否为本人
        """
        rep = {
            'code': 0,
            'msg': ''
        }
        uid = req.GET.get('id')
        is_login = req.session.get('uid', None)
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
        if is_login == uid:
            rep['data']['is_oneself'] = True
        else:
            rep['data']['is_oneself'] = False
        return JsonResponse(rep)

    def http_method_not_allowed(self, request, *args, **kwargs):
        rep = {
            'code': 4040,
            'msg': 'http请求方式错误，应为GET'
        }
        return JsonResponse(rep)


# 用户名更改(PUT)  已完成
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
        '''is_login = req.session.get('uid', None)
        if is_login != uid:
            rep['code'] = 4040
            rep['msg'] = u'请求用户与登录用户不一致'
            return JsonResponse(rep)'''
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

    def http_method_not_allowed(self, request, *args, **kwargs):
        rep = {
            'code': 4040,
            'msg': 'http请求方式错误，应为PUT'
        }
        return JsonResponse(rep)


# 个人简历(GET,PUT) GET,PUT已完成
class MineResume(View):
    # noinspection PyMethodMayBeStatic
    def get(self, req):
        """
        根据前端返回的用户id查询简历并返回
        """
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

    # noinspection PyMethodMayBeStatic
    def put(self, req):
        """
        根据前端返回的简历id和简历数据修改简历
        """
        rep = {
            'code': 0,
            'msg': ''
        }
        rid = req.GET.get('id')
        try:
            resume = Resume.objects.filter(id=rid)[0]
        except Exception as e:
            print('出现错误', repr(e))
            rep['code'] = 4040
            rep['msg'] = u'修改的简历不存在'
            return JsonResponse(rep)
        '''uid = resume.user.id
        is_login = req.session.get('uid', None)
        if is_login != uid:
            rep['code'] = 4040
            rep['msg'] = u'请求用户与登录用户不一致'
            return JsonResponse(rep)'''
        get_data = simplejson.loads(req.body)['data']
        name = get_data['name']
        sex = get_data['sex']
        education = get_data['education']
        identity = get_data['identity']
        major = get_data['major']
        wish_job = get_data['wish_job']
        wish_city = get_data['wish_job']
        wish_salary_max = int(get_data['wish_salary_max'])
        wish_salary_min = int(get_data['wish_salary_min'])
        edu = Education.objects.filter(education__exact=education)
        if wish_salary_min >= wish_salary_max:
            rep['code'] = 4040
            rep['msg'] = u'意料外的错误导致修改失败，请稍后重试\n提示：期望薪资最小值大于等于最大值'
            return JsonResponse(rep)
        if not edu:
            rep['code'] = 4040
            rep['msg'] = u'意料外的错误导致修改失败，请稍后重试\n提示：学历填写有误'
            return JsonResponse(rep)
        if identity not in ('schooling', 'graduate', 'working'):
            rep['code'] = 4040
            rep['msg'] = u'意料外的错误导致修改失败，请稍后重试\n提示：身份填写有误'
            return JsonResponse(rep)
        if sex not in ('man', 'woman'):
            rep['code'] = 4040
            rep['msg'] = u'意料外的错误导致修改失败，请稍后重试\n提示：性别填写有误'
            return JsonResponse(rep)
        try:
            resume.name = name
            resume.sex = sex
            resume.education = edu[0]
            resume.identity = identity
            resume.major = major
            resume.wish_job = wish_job
            resume.wish_city = wish_city
            resume.wish_salary = str(wish_salary_max) + 'k-' + str(wish_salary_min) + 'k'
            resume.save()
        except Exception as e:
            print('出现错误', repr(e))
            rep['code'] = 4040
            rep['msg'] = u'意料外的错误导致修改失败，请稍后重试'
            return JsonResponse(rep)
        rep['code'] = 2000
        rep['msg'] = u'修改成功'
        return JsonResponse(rep)

    def http_method_not_allowed(self, request, *args, **kwargs):
        rep = {
            'code': 4040,
            'msg': 'http请求方式错误，应为GET/PUT'
        }
        return JsonResponse(rep)


# 个人收藏职位(GET,DEL)  GET,DEL已完成
class WishProfession(View):
    # noinspection PyMethodMayBeStatic
    def get(self, req):
        """
        根据前端返回的用户id，查询该用户收藏的职位并返回
        """
        rep = {
            'code': 0,
            'msg': ''
        }
        uid = req.GET.get('id')
        try:
            user = User.objects.filter(id=uid)[0]
            wish = Wish.objects.filter(user_id=user.id)
        except Exception as e:
            print('出现错误', repr(e))
            rep['code'] = 4040
            rep['msg'] = u'查询的用户或收藏的职位不存在'
            return JsonResponse(rep)
        rep['code'] = 2000
        rep['msg'] = u'查询成功'
        rep['data'] = dict()
        if len(wish) == 1:
            serializer = serializers.WishSerializer(wish[0])
            rep['data']['wish'] = serializer.data
        elif len(wish) >= 2:
            serializer = serializers.WishSerializer(wish, many=True)
            rep['data']['wish'] = serializer.data
        return JsonResponse(rep)

    # noinspection PyMethodMayBeStatic
    def delete(self, req):
        """
        根据前端返回的用户id和收藏id,判断是否匹配
        若匹配，则尝试删除；否则返回错误信息
        """
        get_data = simplejson.loads(req.body)
        rep = {
            'code': 0,
            'msg': '',
        }
        uid = get_data['user_id']
        wid = get_data['wish_id']
        '''is_login = req.session.get('uid', None)
        if is_login != uid:
            rep['code'] = 4040
            rep['msg'] = u'请求用户与登录用户不一致'
            return JsonResponse(rep)'''
        try:
            user = User.objects.filter(id=uid)[0]
            wish = Wish.objects.filter(id=wid)[0]
        except Exception as e:
            print('出现错误', repr(e))
            rep['code'] = 4040
            rep['msg'] = u'查询的用户或收藏的职位不存在'
            return JsonResponse(rep)
        if wish.user == user:
            try:
                wish.delete()
            except Exception as e:
                print('出现错误', repr(e))
                rep['code'] = 4040
                rep['msg'] = u'意料外的错误导致操作失败'
                return JsonResponse(rep)
            rep['code'] = 2000
            rep['msg'] = u'删除成功'
            return JsonResponse(rep)
        else:
            rep['code'] = 4040
            rep['msg'] = u'待删除的收藏和所属用户不对应'
            return JsonResponse(rep)

    def http_method_not_allowed(self, request, *args, **kwargs):
        rep = {
            'code': 4040,
            'msg': 'http请求方式错误，应为GET/DEL'
        }
        return JsonResponse(rep)


# 个人评论(GET,DEL) GET,DEL已完成
class MineComment(View):
    # noinspection PyMethodMayBeStatic
    def get(self, req):
        """
        根据前端返回的用户id查询评论并返回
        """
        rep = {
            'code': 0,
            'msg': '',
        }
        uid = req.GET.get('id')
        try:
            user = User.objects.filter(id=uid)[0]
            comments = Comment.objects.filter(user=user)
        except Exception as e:
            print('出现错误', repr(e))
            rep['code'] = 4040
            rep['msg'] = u'查询的用户不存在'
            return JsonResponse(rep)
        rep['code'] = 2000
        rep['msg'] = u'查询成功'
        rep['data'] = dict()
        if len(comments) == 1:
            serializer = serializers.CommentSerializer(comments[0])
            rep['data']['comment'] = serializer.data
        elif len(comments) >= 2:
            serializer = serializers.CommentSerializer(comments, many=True)
            rep['data']['comment'] = serializer.data
        return JsonResponse(rep)

    # noinspection PyMethodMayBeStatic
    def delete(self, req):
        """
        根据前端返回的用户id和评论id,判断是否匹配
        若匹配，则尝试删除；否则返回错误信息
        """
        get_data = simplejson.loads(req.body)
        rep = {
            'code': 0,
            'msg': '',
        }
        uid = get_data['user_id']
        cid = get_data['comment_id']
        '''is_login = req.session.get('uid', None)
        if is_login != uid:
            rep['code'] = 4040
            rep['msg'] = u'请求用户与登录用户不一致'
            return JsonResponse(rep)'''
        try:
            user = User.objects.filter(id=uid)[0]
            comment = Comment.objects.filter(id=cid)[0]
        except Exception as e:
            print('出现错误', repr(e))
            rep['code'] = 4040
            rep['msg'] = u'查询的用户或评论不存在'
            return JsonResponse(rep)
        if comment.user == user:
            try:
                comment.delete()
            except Exception as e:
                print('出现错误', repr(e))
                rep['code'] = 4040
                rep['msg'] = u'意料外的错误导致操作失败'
                return JsonResponse(rep)
            rep['msg'] = u'删除成功'
            rep['code'] = 2000
            return JsonResponse(rep)
        else:
            rep['code'] = 4040
            rep['msg'] = u'待删除的评论和所属用户不对应'
            return JsonResponse(rep)

    def http_method_not_allowed(self, request, *args, **kwargs):
        rep = {
            'code': 4040,
            'msg': 'http请求方式错误，应为GET/DEL'
        }
        return JsonResponse(rep)


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
            if action == 'register':
                is_register = User.objects.filter(email__exact=email)
                if len(is_register) != 0:
                    rep['code'] = 4040
                    rep['msg'] = u'该邮箱已被注册'
                    return JsonResponse(rep)
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

    def http_method_not_allowed(self, request, *args, **kwargs):
        rep = {
            'code': 4040,
            'msg': 'http请求方式错误，应为GET'
        }
        return JsonResponse(rep)


# 简历投递记录(GET) 已完成
class LaunchRecord(View):
    # noinspection PyMethodMayBeStatic
    def get(self, req):
        """
        根据前端返回的用户id查询投递记录并返回
        """
        uid = req.GET.get('id')
        rep = {
            'code': 0,
            'msg': ''
        }
        try:
            user = User.objects.filter(id=uid)[0]
            records = Record.objects.filter(user=user)
        except Exception as e:
            rep['code'] = 4040
            rep['msg'] = u'查询的用户不存在'
            print('出现错误', repr(e))
            return JsonResponse(rep)
        rep['code'] = 2000
        rep['msg'] = u'查询成功'
        rep['data'] = dict()
        if len(records) == 1:
            serializer = serializers.RecordSerializer(records[0])
            rep['data']['record'] = serializer.data
        elif len(records) >= 2:
            serializer = serializers.RecordSerializer(records, many=True)
            rep['data']['record'] = serializer.data
        return JsonResponse(rep)

    def http_method_not_allowed(self, request, *args, **kwargs):
        rep = {
            'code': 4040,
            'msg': 'http请求方式错误，应为GET/DEL'
        }
        return JsonResponse(rep)


# 取消简历投递(GET) 已完成
class LaunchCancel(View):
    # noinspection PyMethodMayBeStatic
    def get(self, req):
        """
        根据前端返回的用户id和记录id判断是否匹配
        若匹配且记录未处理，则修改
        """
        get_data = simplejson.loads(req.body)
        uid = get_data['user_id']
        rid = get_data['record_id']
        rep = {
            'code': 0,
            'msg': ''
        }
        '''is_login = req.session.get('uid', None)
        if is_login != uid:
            rep['code'] = 4040
            rep['msg'] = u'请求用户与登录用户不一致'
            return JsonResponse(rep)'''
        try:
            record = Record.objects.filter(id=rid)[0]
        except Exception as e:
            rep['code'] = 4040
            rep['msg'] = u'查询的记录不存在'
            print('出现错误', repr(e))
            return JsonResponse(rep)
        if record.user.id != uid:
            rep['code'] = 4040
            rep['msg'] = u'请求用户和投递记录所属的用户不一致'
            return JsonResponse(rep)
        try:
            if record == 'unclear':
                record.status = 'cancelled'
                record.save()
            else:
                rep['code'] = 4040
                rep['msg'] = u'该简历已被处理，不能取消'
                return JsonResponse(rep)
        except Exception as e:
            rep['code'] = 4040
            rep['msg'] = u'意料外的错误导致修改失败'
            print('出现错误', repr(e))
            return JsonResponse(rep)
        rep['code'] = 2000
        rep['msg'] = u'处理成功'
        return JsonResponse(rep)

    def http_method_not_allowed(self, request, *args, **kwargs):
        rep = {
            'code': 4040,
            'msg': 'http请求方式错误，应为GET/DEL'
        }
        return JsonResponse(rep)
