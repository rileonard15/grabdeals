from django.contrib import admin
from www import models as db

admin.site.register(db.Profile)
admin.site.register(db.Product)
admin.site.register(db.Category)
admin.site.register(db.Size)
admin.site.register(db.Color)
admin.site.register(db.Image)
admin.site.register(db.DeliveryAddress)
