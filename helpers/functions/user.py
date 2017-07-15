from django.contrib.auth import models
from django.contrib.auth.models import User
from helpers.serializers import serialize as s


class UserInstance():
    def __init__(self, data=None):

        if data:
            self.instance = dict()
            self.instance['first_name'] = data['first_name']
            self.instance['last_name'] = data['last_name']
            self.instance['email'] = data['email']
            self.instance['username'] = data['username']
            self.instance['password'] = data['password']

    def create_user(self):
        new_user = User.objects.create_user(username=self.instance["username"],
                                            email=self.instance["email"],
                                            password=self.instance["password"],
                                            first_name=self.instance["first_name"],
                                            last_name=self.instance["last_name"])

        g = models.Group.objects.get(name='SELLER')
        g.user_set.add(new_user)
        new_user.save()

        return new_user

    def check_exist_user(self, email):
        try:
            user = User.objects.get(email=email)
        except Exception as e:
            return False

        return user


    @classmethod
    def format_user_data(cls, data):
        item = dict()
        item['first_name'] = data.get('first_name', None)
        item['last_name'] = data.get('last_name', None)
        item['email'] = data.get('email', None)
        item['username'] = data.get('username', None)
        item['password'] = data.get('password', None)

        if not item['email']:
            raise Exception('Email is required')

        if not item['username']:
            raise Exception('Username is required')

        if not item['password']:
            raise Exception('Password is required')

        item['username'] = 'fb_' + item['username']

        return cls(data)
