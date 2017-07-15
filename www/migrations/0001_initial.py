# -*- coding: utf-8 -*-
# Generated by Django 1.11.1 on 2017-06-07 05:35
from __future__ import unicode_literals

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Profile',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created', models.DateTimeField(auto_now_add=True)),
                ('updated', models.DateTimeField(auto_now=True)),
                ('address', models.CharField(max_length=200, null=True)),
                ('timezone', models.CharField(default='Asia/Manila', max_length=50)),
                ('mobile', models.CharField(max_length=50, null=True)),
                ('telno', models.CharField(max_length=50, null=True)),
                ('fb_accesstoken', models.TextField(null=True)),
                ('fb_id', models.CharField(max_length=20, null=True)),
                ('user', models.OneToOneField(null=True, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
    ]
