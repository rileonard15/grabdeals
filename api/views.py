import json
from django.shortcuts import render
from helpers.base import BaseHandler
from www import models as db

from rest_framework.authentication import SessionAuthentication
from rest_framework.authentication import BasicAuthentication
from rest_framework.authentication import TokenAuthentication
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework.authtoken.models import Token
from rest_framework import status
from rest_framework.renderers import JSONRenderer

from helpers.functions.product import ProductInstance
from helpers.functions.transaction import OrderInstance
from helpers.functions import uhack
from helpers import helper as h
from helpers.decorators import validate_required_fields

class AppLogin(BaseHandler):
	authentication_classes = (SessionAuthentication, BasicAuthentication)
	permission_classes = (IsAuthenticated,)

	def get(self, request):
		response = {'name': 'test name'}
		return self.api_response(200, response)

	def post(self, request, format=None):
		token = Token.objects.get_or_create(user=request.user)

		content = {
			'app_email': request.user.email,
			'token': token[0].key,
			'group': request.user.groups.all()[0].name
		}

		return self.api_response(200, content)

class OrderApiHandler(BaseHandler):
	authentication_classes = (SessionAuthentication, TokenAuthentication)
	permission_classes = (IsAuthenticated,)

	def get(self, request):
		transaction = self.request.GET.get('transaction')
		ins = OrderInstance()
		transaction_item = ins.get_transactions(transaction)

		return self.api_response(200, transaction_item)


	@validate_required_fields(['product', 'quantity', 'source'])
	def post(self, request):
		pcode = self.request.data['product']
		ins = ProductInstance()
		try:
			product_json, product_obj = ins.get_product(pcode)
		except Exception as e:
			return self.api_response(400, str(e))


		invoice_id = h.generate_id(size=10)
		payables = int(self.request.data['quantity']) * product_obj.price

		transaction_info = dict()
		transaction_info['transaction_id'] = invoice_id
		transaction_info['source'] = self.request.data['source']
		transaction_info['amount'] = payables
		uhack_reponse = json.loads(uhack.pay_amount(transaction_info))

		data = dict()
		data['quantity'] = self.request.data['quantity']
		data['invoice'] = invoice_id

		if uhack_reponse['status'] == 'S':
			data['paid'] = True
			data['confirmation_no'] = uhack_reponse['confirmation_no']
		else:
			data['paid'] = False
			data['confirmation_no'] = 'n/a'

		data['delivery_address'] = 1
		data['status'] = "READY_FOR_DELIVERY"
		data['size'] = self.request.data.get('size', 'n/a')
		data['color'] = self.request.data.get('color', 'n/a')
		data['transaction_id'] = uhack_reponse['transaction_id']
		data['amount'] = payables

		ins = OrderInstance.format_order_data(data, product_obj, self.request.user)
		ins.create_order()

		return self.api_response(200, uhack_reponse)


class ProductInfo(BaseHandler):
	def get(self, request, pcode):
		ins = ProductInstance()
		try:
			product, product_obj = ins.get_product(pcode)
		except Exception as e:
			return self.api_response(400, str(e))

		return self.api_response(200, product)
