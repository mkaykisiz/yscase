import logging

from django.test import TestCase

from yscase.food.models import Food
from yscase.order.models import Order, OrderFood, \
    FOOD_NOT_IN_MENU_ERROR

logger = logging.getLogger(__name__)

ORDER_ID = "8526c200-c95b-4082-b0f7-040d65297042"


class TestGetOrders(TestCase):
    fixtures = ["yscase/order/fixture.json"]

    def test_food_not_in_menu(self):
        order = Order.objects.filter(order_token=ORDER_ID).first()
        food = Food.objects.first()
        try:
            OrderFood.objects.create(order=order, food=food,
                                     total=3, price=20.23)
        except Exception as e:
            self.assertEqual(FOOD_NOT_IN_MENU_ERROR, str(e))
