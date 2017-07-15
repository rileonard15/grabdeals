from helpers.serializers import serialize as s
from helpers import helper as h
from www import models as db

class ProductInstance():
    def __init__(self, data=None):

        self.instance = data

    def create_product(self):
        serializer = s.ProductSerializer(data=self.instance)
        if serializer.is_valid():
            serializer.save()

        return serializer.data


    @staticmethod
    def get_product(pcode):
        try:
            product = db.Product.objects.get(code=pcode)
        except Exception as e:
            raise Exception('Product doesnt exist')
        serializer = s.ProductSerializer(data=[product], many=True)

        if serializer.is_valid():
            serializer.save()

        return serializer.data, product


    @classmethod
    def format_product_data(cls, data, user_obj):
        item = dict()

        item["name"] = data.get('name', None)
        item["description"] = data.get('description', None)
        item["quantity"] = data.get('quantity', None)
        item["code"] = data.get('code', None)
        item["timezone"] = 'Asia/Manila'
        item["owner"] = user_obj.id
        item["price"] = data.get('price', None)

        return cls(item)
