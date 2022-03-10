import json

from django.http import HttpResponse
from django.shortcuts import render

# Create your views here.
from django.views import View

# 投递简历
from user.models import Resume, Record, User

from company.models import Profession

from industry.models import Work

from comment.models import Comment


class ResumePost(View):
    def post(self, request):
        '''

        :param request: 请求
        :return: 成功信息
        '''
        content = json.loads(request.body.decode())
        resume_id = content["resume"]
        profession_id = content['profession']
        try:
            resume = Resume.objects.get(id=resume_id)
        except:
            response = {"code": 4040, "msg": "简历不存在"}
            return HttpResponse(json.dumps(response, ensure_ascii=False),
                                content_type="application/json,charset=utf-8")
        try:
            profession = Profession.objects.get(id=profession_id)
        except:
            response = {"code": 4040, "msg": "职位不存在"}
            return HttpResponse(json.dumps(response, ensure_ascii=False),
                                content_type="application/json,charset=utf-8")
        Record.objects.create(profession=profession, status='unclear', resume=resume, user=resume.user)
        profession.application = profession.application + 1
        profession.save()
        company = profession.company
        company.applicant = company.applicant + 1
        company.save()
        work = Work.objects.get(name=profession.name)
        work.demand = work.demand + 1
        work.save()
        response = {"code": 200, "msg": "简历投递成功"}
        return HttpResponse(json.dumps(response, ensure_ascii=False),
                            content_type="application/json,charset=utf-8")

    def http_method_not_allowed(self, request, *args, **kwargs):
        response = {"code": 4040, "msg": "http请求方式错误(非post请求)"}
        return HttpResponse(json.dumps(response, ensure_ascii=False),
                            content_type="application/json,charset=utf-8")


class CommentPost(View):
    def post(self, request):
        '''

        :param request: 请求，接受comment的detail和profession的id
        :return:
        '''
        content = json.loads(request.body.decode())
        comment = content["comment"]
        if request.session.get('uid') == '':
            response = {"code": 4040, "msg": "未登录，返回登录页"}
            return HttpResponse(json.dumps(response, ensure_ascii=False),
                                content_type="application/json,charset=utf-8")
        if comment["detail"][0] == ' ' or comment["detail"][0] == '\n':
            response = {"code": 4040, "msg": "输入不合法"}
            return HttpResponse(json.dumps(response, ensure_ascii=False),
                                content_type="application/json,charset=utf-8")
        user_id = 1
        user_id = request.session.get('uid')['uid']
        Comment.objects.create(detail=comment["detail"], user=User.objects.get(id=user_id),
                               profession=Profession.objects.get(id=comment["profession"]["id"]))
        response = {"code": 2000, "msg": "发言成功"}
        return HttpResponse(json.dumps(response, ensure_ascii=False),
                            content_type="application/json,charset=utf-8")
    def http_method_not_allowed(self, request, *args, **kwargs):
        response = {"code": 4040, "msg": "http请求方式错误(非post请求)"}
        return HttpResponse(json.dumps(response, ensure_ascii=False),
                            content_type="application/json,charset=utf-8")

