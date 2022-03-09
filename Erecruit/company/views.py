import json

from django.http import HttpResponse
from django.shortcuts import render

# Create your views here.
from django.views import View

from company.models import Profession

from user.models import Wish, Resume, Record

from comment.models import Comment


class ProfessionDisplay(View):
    def get(self, request, name):
        '''
        :param name:职业的名字
        :param request:请求
        :return:职位对应的公司和行业,如果没有获取到name返回错误信息
        '''
        if name == '':
            response = {"code": 4040, "msg": "name不能为空"}
            return HttpResponse(json.dumps(response, ensure_ascii=False),
                                content_type="application/json,charset=utf-8")
        result = []
        professions = Profession.objects.filter(name=name)
        try:
            profession = professions[0]
        except:
            response = {"code": 4040, "msg": "name不存在"}
            return HttpResponse(json.dumps(response, ensure_ascii=False),
                                content_type="application/json,charset=utf-8")
        for profession in professions:
            company = profession.company
            industry = profession.industry
            education = profession.education
            result.append({"id": profession.id, "industry": {"id": industry.id, "name": industry.name},
                           "company": {"id": company.id, "name": company.name, "applicant": company.applicant,
                                       "detail": company.detail}, "salary": profession.salary,
                           "name": profession.name,
                           "education": {"education": education.education, "id": education.id}})
        response = {"code": 200, "data": {"result": result}, "msg": "返回成功"}
        return HttpResponse(json.dumps(response, ensure_ascii=False),
                            content_type="application/json,charset=utf-8")

    def http_method_not_allowed(self, request, *args, **kwargs):
        response = {"code": 4040, "msg": "http请求方式错误(非get请求)"}
        return HttpResponse(json.dumps(response, ensure_ascii=False),
                            content_type="application/json,charset=utf-8")


class ProfessionDetail(View):
    def get(self, request, id):
        '''

        :param request: 请求
        :param id: 具体职位的id
        :return: profession的详细信息和是否被收藏是否提交过简历
        '''
        if request.session.get('uid') == '':
            response = {"code": 4040, "msg": "未登录，返回登录页"}
            return HttpResponse(json.dumps(response, ensure_ascii=False),
                                content_type="application/json,charset=utf-8")
        if id == '':
            response = {"code": 4040, "msg": "id不能为空"}
            return HttpResponse(json.dumps(response, ensure_ascii=False),
                                content_type="application/json,charset=utf-8")
        user_id = request.session.get('uid')['uid']
        try:
            profession = Profession.objects.get(id=id)
        except:
            response = {"code": 4040, "msg": "id不存在"}
            return HttpResponse(json.dumps(response, ensure_ascii=False),
                                content_type="application/json,charset=utf-8")
        is_wish = False
        is_launch = False
        for wish in Wish.objects.all():
            if wish.user.id == user_id and wish.profession.id == id:
                is_wish = True
        for resume in Record.objects.all():
            if resume.user.id == user_id and resume.profession.id == id:
                is_launch = True
        data = {"is_wish": is_wish, "is_launch": is_launch,
                "profession": {"id": profession.id, "salary": profession.salary,
                               "name": profession.name,
                               "industry": {"id": profession.industry.id, "name": profession.industry.name},
                               "company": {"id": profession.company.id, "name": profession.company.name,
                                           "applicant":
                                               profession.company.applicant,
                                           "detail": profession.company.detail},
                               "education": {"id": profession.education.id,
                                             "education": profession.education.education}}}
        response = {"code": 2000, "msg": "查询成功", "data": data}
        return HttpResponse(json.dumps(response, ensure_ascii=False),
                            content_type="application/json,charset=utf-8")

    def http_method_not_allowed(self, request, *args, **kwargs):
        response = {"code": 4040, "msg": "http请求方式错误(非get请求)"}
        return HttpResponse(json.dumps(response, ensure_ascii=False),
                            content_type="application/json,charset=utf-8")


class ProfessionComment(View):
    def get(self, request, id):
        '''

        :param request: 请求
        :param id: 职位的id
        :return: 职位相关信息和评论
        '''
        if id == '':
            response = {"code": 4040, "msg": "id不能为空"}
            return HttpResponse(json.dumps(response, ensure_ascii=False),
                                content_type="application/json,charset=utf-8")
        try:
            profession = Profession.objects.get(id=id)
        except:
            response = {"code": 4040, "msg": "id不存在"}
            return HttpResponse(json.dumps(response, ensure_ascii=False),
                                content_type="application/json,charset=utf-8")
        comment_list = []
        for comment in Comment.objects.all():
            if comment.profession.id == id:
                comment_list.append(
                    {"id": comment.id,
                     "user": {"id": comment.user.id, "username": comment.user.username, "email": comment.user.email},
                     "date": str(comment.date), "detail": comment.detail,
                     "profession": {"id": comment.profession.id, "industry": {"id": comment.profession.industry.id,
                                                                              "name": comment.profession.industry.name},
                                    "company": {"id": comment.profession.company.id,
                                                "name": comment.profession.company.name,
                                                "applicant": comment.profession.company.applicant,
                                                "detail": comment.profession.company.detail,
                                                "image": str(comment.profession.company.img)},
                                    "salary": comment.profession.salary, "name": comment.profession.name,
                                    "education": {"education": comment.profession.education.education,
                                                  "id": comment.profession.education.id}}})
        response = {"code": 2000, "msg": '成功', "data": {"comment": comment_list}}
        return HttpResponse(json.dumps(response, ensure_ascii=False),
                            content_type="application/json,charset=utf-8")

    def http_method_not_allowed(self, request, *args, **kwargs):
        response = {"code": 4040, "msg": "http请求方式错误(非get请求)"}
        return HttpResponse(json.dumps(response, ensure_ascii=False),
                            content_type="application/json,charset=utf-8")
