from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login
from django.contrib.auth import logout
from django.http import HttpResponse

# Create your views here.
from django.shortcuts import render
from helpers.base import BaseHandler
from helpers import logger
from helpers.functions.user import UserInstance
from helpers.functions.profile import ProfileInstance
from helpers.decorators import user_permission



class FrontPage(BaseHandler):
	def get(self, request):
		self.tv['login_url'] = fb.generate_login_url()
		return self.render(request, 'index.html')


class LogoutUser(BaseHandler):
	def get(self, request):
		logout(request)
		return redirect('/')
