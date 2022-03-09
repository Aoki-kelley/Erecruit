import json

from django.http import HttpResponse
from django.shortcuts import render

# Create your views here.
from django.views import View

# 投递简历
from user.models import Resume, Record

from company.models import Profession

from industry.models import Work


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
