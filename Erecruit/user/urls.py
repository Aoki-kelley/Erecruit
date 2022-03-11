"""Erecruit URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from user import views

urlpatterns = [
    path('register/', views.Register.as_view(), name='register'),  # POST
    path('login/', views.Login.as_view(), name='login'),  # POST
    path('logout/', views.Logout.as_view(), name='login'),  # GET
    path('space/', views.HomePage.as_view(), name='homepage'),  # GET
    path('reset_name/', views.ResetName.as_view(), name='reset_name'),  # PUT
    path('resume/detail/', views.MineResume.as_view(), name='mine_resume_detail'),  # GET
    path('resume/change/', views.MineResume.as_view(), name='mine_resume_change'),  # PUT
    path('record/status/', views.LaunchRecord.as_view(), name='launch_record'),  # GET
    path('record/cancel/', views.LaunchCancel.as_view(), name='launch_cancel'),  # GET
    path('wish_profession/detail/', views.WishProfession.as_view(), name='wish_profession_detail'),  # GET
    path('wish_profession/delete/', views.WishProfession.as_view(), name='wish_profession_delete'),  # DEL
    path('comment/detail/', views.MineComment.as_view(), name='comment_detail'),  # GET
    path('comment/delete/', views.MineComment.as_view(), name='comment_delete'),  # DEL
    path('captcha/send/', views.SendCode.as_view(), name='send_code'),  # POST
]
