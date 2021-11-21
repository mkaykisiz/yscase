from django.contrib import admin

from .models import Order, OrderFood
from ..libs.admin import TimestampedModelAdmin, TimestampedModelStackedInline


class OrderFoodInline(TimestampedModelStackedInline):
    model = OrderFood


@admin.register(Order)
class OrderAdmin(TimestampedModelAdmin):
    list_display = ('order_token', 'user', 'restaurant', 'created_at')
    list_filter = ('restaurant', 'user')
    search_fields = ['order_token']
    inlines = [OrderFoodInline]
