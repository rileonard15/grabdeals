# -*- coding: utf-8 -*-
# Generated by Django 1.11.1 on 2017-07-15 08:43
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('www', '0007_order_confirmation_no'),
    ]

    operations = [
        migrations.AddField(
            model_name='order',
            name='amount',
            field=models.FloatField(default=0),
        ),
    ]
