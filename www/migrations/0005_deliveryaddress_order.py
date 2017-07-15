# -*- coding: utf-8 -*-
# Generated by Django 1.11.1 on 2017-07-15 07:24
from __future__ import unicode_literals

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('www', '0004_auto_20170715_0455'),
    ]

    operations = [
        migrations.CreateModel(
            name='DeliveryAddress',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created', models.DateTimeField(auto_now_add=True)),
                ('updated', models.DateTimeField(auto_now=True)),
                ('address', models.TextField(null=True)),
                ('first_name', models.CharField(max_length=50)),
                ('last_name', models.CharField(max_length=50)),
                ('phone', models.CharField(max_length=20)),
                ('owner', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='Order',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created', models.DateTimeField(auto_now_add=True)),
                ('updated', models.DateTimeField(auto_now=True)),
                ('quantity', models.IntegerField(default=1)),
                ('invoice', models.CharField(max_length=10)),
                ('paid', models.BooleanField(default=False)),
                ('color', models.CharField(max_length=10, null=True)),
                ('size', models.CharField(max_length=10, null=True)),
                ('status', models.CharField(default='PENDING', max_length=20)),
                ('buyer', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
                ('delivery_address', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='www.DeliveryAddress')),
                ('product', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='www.Product')),
            ],
        ),
    ]
