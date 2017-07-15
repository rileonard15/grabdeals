from django.db import models
from django.contrib.auth.models import User


class Profile(models.Model):
    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)
    address = models.CharField(max_length=200, null=True)
    timezone = models.CharField(max_length=50, default="Asia/Manila")
    mobile = models.CharField(max_length=50, null=True)
    telno = models.CharField(max_length=50, null=True)
    store = models.CharField(max_length=150, null=True)
    user = models.OneToOneField(User, null=True)
    fb_accesstoken = models.TextField(null=True)
    fb_id = models.CharField(max_length=20, null=True)

class Color(models.Model):
    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)
    name = models.CharField(max_length=50, null=True)
    tag = models.CharField(max_length=50, null=True)

    def __str__(self):
        return self.name

class Size(models.Model):
    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)
    name = models.CharField(max_length=50, null=True)
    tag = models.CharField(max_length=50, null=True)
    measurement = models.CharField(max_length=50, null=True)

    def __str__(self):
        return self.name

class Category(models.Model):
    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)
    name = models.CharField(max_length=50, null=True)
    tag = models.CharField(max_length=50, null=True)

    def __str__(self):
        return self.name

class Image(models.Model):
    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)
    src = models.TextField(null=True)

    def __str__(self):
        return self.src

class Product(models.Model):
    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)
    name = models.CharField(max_length=50, null=True)
    description = models.TextField(null=True)
    quantity = models.IntegerField(default=0)
    code = models.CharField(max_length=10, null=True)
    owner = models.ForeignKey(User)
    price = models.FloatField(default=0)
    colors = models.ManyToManyField(Color)
    sizes = models.ManyToManyField(Size)
    categories = models.ManyToManyField(Category)
    images = models.ManyToManyField(Image)

    def __str__(self):
        return self.name

class DeliveryAddress(models.Model):
    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)
    address = models.TextField(null=True)
    owner = models.ForeignKey(User)
    first_name = models.CharField(max_length=50)
    last_name = models.CharField(max_length=50)
    phone = models.CharField(max_length=20)


class Order(models.Model):
    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)
    product = models.ForeignKey(Product)
    quantity = models.IntegerField(default=1)
    invoice = models.CharField(max_length=10)
    transaction_id = models.CharField(max_length=50, null=True)
    buyer = models.ForeignKey(User)
    paid = models.BooleanField(default=False)
    delivery_address = models.ForeignKey(DeliveryAddress, null=True)
    color = models.CharField(max_length=10, null=True)
    size = models.CharField(max_length=10, null=True)
    status = models.CharField(max_length=20, default='PENDING')  # PENDING | FOR_DELIVERY | SUCCESS
