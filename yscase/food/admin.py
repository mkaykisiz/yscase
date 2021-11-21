from django.contrib import admin
from .models import Food
from ..libs.admin import TimestampedModelAdmin


class FoodAdmin(TimestampedModelAdmin):
    list_display = ('name', 'cover_image', 'created_at')
    search_fields = ['name', ]


admin.site.register(Food, FoodAdmin)
