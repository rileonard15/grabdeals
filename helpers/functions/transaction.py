from helpers.serializers import serialize as s
from helpers import helper as h
from www import models as db

class OrderInstance():
    def __init__(self, data=None):

        self.instance = data

    def create_order(self):
        serializer = s.OrderSerializer(data=self.instance)
        if serializer.is_valid():
            serializer.save()
        else:
            print(serializer.errors)

        return serializer.data


    @classmethod
    def format_order_data(cls, data, product_obj, user_obj):
        item = dict()

        item["product"] = product_obj.id
        item["buyer"] = user_obj.id

        item["quantity"] = data.get('quantity', None)
        item["invoice"] = data.get('invoice', None)
        item["paid"] = False
        item["status"] = data.get('status', None)
        item["size"] = data.get('size', None)
        item["color"] = data.get('color', None)
        item["delivery_address"] = data.get('delivery_address', None)

        return cls(item)
