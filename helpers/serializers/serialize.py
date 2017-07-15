from rest_framework import serializers
from django.contrib.auth.models import User
from www import models as db



class ProfileSerializer(serializers.ModelSerializer):
    class Meta:
        model = db.Profile
        fields = ('address', 'mobile', 'telno', 'user',
                  'fb_accesstoken', 'fb_id',)


class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ('first_name', 'last_name', 'email', 'username',)

class SizeSerializer(serializers.ModelSerializer):
    class Meta:
        model = db.Size
        fields = ('name', 'tag', 'measurement')

class CategorySerializer(serializers.ModelSerializer):
    class Meta:
        model = db.Size
        fields = ('name', 'tag',)

class ColorSerializer(serializers.ModelSerializer):
    class Meta:
        model = db.Size
        fields = ('name', 'tag',)


class ProductSerializer(serializers.ModelSerializer):
    colors = ColorSerializer(read_only=True, many=True)
    sizes = SizeSerializer(read_only=True, many=True)
    categories = CategorySerializer(read_only=True, many=True)
    class Meta:
        model = db.Product
        fields = ('name', 'description', 'quantity', 'code', 'owner',
                  'price', 'colors', 'sizes', 'categories')

class OrderSerializer(serializers.ModelSerializer):
    class Meta:
        model = db.Order
        fields = ('product', 'quantity', 'invoice', 'buyer', 'paid', 'status',
                  'color', 'size', 'delivery_address', 'transaction_id',)
