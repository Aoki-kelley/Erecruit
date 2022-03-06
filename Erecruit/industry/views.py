import json

from django.http import JsonResponse, HttpResponse
from django.shortcuts import render

# Create your views here.
from django.views import View

from company.models import Profession
from industry.models import Work


class Homepage(View):
    def get(self, request):
        p_obs = Profession.objects
        p_obs_list = p_obs.order_by('application').reverse()
        hot_profession = []
        n = 0
        for p_ob in p_obs_list:
            n += 1
            # salary = str(p_ob.salary / 1000) + 'k'
            salary = p_ob.salary
            hot_profession.append({"id": p_ob.id, "industry": {'id': p_ob.industry.id, 'name': p_ob.industry.name},
                                   "company": {'id': p_ob.company.id, 'name': p_ob.company.name,
                                               'applicant': p_ob.company.applicant, 'detail': p_ob.company.detail},
                                   "salary": salary, "name": p_ob.name,
                                   "education": {'id': p_ob.education.id, 'education': p_ob.education.education}})
            if n == 10:
                break
        w_obs = Work.objects
        w_obs_list = w_obs.order_by('demand').reverse()
        hot_work = []
        n = 0
        for w_ob in w_obs_list:
            n += 1
            hot_work.append({"id": w_ob.id, "industry": {'id': w_ob.industry.id, 'name': w_ob.industry.name},
                             "demand": w_ob.demand})
            if n == 10:
                break
        response = {"status_code": 2000, "code": True, "hot_profession": hot_profession, "hot_work": hot_work}
        return HttpResponse(json.dumps(response, ensure_ascii=False),
                            content_type="application/json,charset=utf-8")
