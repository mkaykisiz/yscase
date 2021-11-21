from django.contrib import admin

from .models import Restaurant, RestaurantCategory, Menu
from ..libs.admin import TimestampedModelAdmin, TimestampedModelStackedInline


@admin.register(RestaurantCategory)
class RestaurantCategoryAdmin(TimestampedModelAdmin):
    list_display = ('title', 'created_at')
    search_fields = ['title']
    prepopulated_fields = {'slug': ('title',)}


class MenuInline(TimestampedModelStackedInline):
    model = Menu


@admin.register(Restaurant)
class RestaurantAdmin(TimestampedModelAdmin):
    list_display = ('name', 'category', 'created_at')
    list_filter = ("category",)
    search_fields = ['name', 'category__title']
    inlines = [MenuInline]


@admin.register(Menu)
class MenuAdmin(TimestampedModelAdmin):
    list_display = ('restaurant', 'food', 'created_at')
    list_filter = ('restaurant', 'food')
    search_fields = ['restaurant__name', 'food__name']
