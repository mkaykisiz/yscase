import logging
from unittest import mock

from django.test import TestCase
from django.urls import reverse
from rest_framework import status

from yscase.order.models import FOOD_NOT_IN_MENU_ERROR

logger = logging.getLogger(__name__)


CREATE_ORDER_DATA = {
    "order_items": [
        {
            "food": 1,
            "total": 5
        }
    ],
    "user": 1,
    "restaurant": 1
}

CREATE_ORDER_EMPTY_ORDER_LIST_DATA = {
    "order_items": [
    ],
    "user": 1,
    "restaurant": 1
}

CREATE_ORDER_DATA_NOT_IN_MENU = {
    "order_items": [
        {
            "food": 2,
            "total": 5
        }
    ],
    "user": 1,
    "restaurant": 1
}


def mocked_set_order_to_publish(*args, **kwargs):
    return


class TestCreateOrder(TestCase):
    fixtures = ["yscase/api/v1/fixture.json"]

    @mock.patch('yscase.api.v1.views.OrderViewSet.set_order_to_publish',
                mocked_set_order_to_publish)
    def test_success_new_order(self):
        url = reverse('orders-list')
        response = self.client.post(url, CREATE_ORDER_DATA,
                                    content_type='application/json')
        self.assertEqual(response.status_code, status.HTTP_201_CREATED)

    @mock.patch('yscase.api.v1.views.OrderViewSet.set_order_to_publish',
                mocked_set_order_to_publish)
    def test_bad_request(self):
        url = reverse('orders-list')
        response = self.client.post(url, {}, content_type='application/json')
        self.assertEqual(response.status_code, status.HTTP_400_BAD_REQUEST)
        self.assertIn('order_items', response.data)

    @mock.patch('yscase.api.v1.views.OrderViewSet.set_order_to_publish',
                mocked_set_order_to_publish)
    def test_bad_request_empty_order_list(self):
        url = reverse('orders-list')
        response = self.client.post(url, CREATE_ORDER_EMPTY_ORDER_LIST_DATA,
                                    content_type='application/json')
        self.assertEqual(response.status_code, status.HTTP_400_BAD_REQUEST)
        self.assertIn('order_items', response.data)

    @mock.patch('yscase.api.v1.views.OrderViewSet.set_order_to_publish',
                mocked_set_order_to_publish)
    def test_food_not_in_menu(self):
        url = reverse('orders-list')
        response = self.client.post(url, CREATE_ORDER_DATA_NOT_IN_MENU,
                                    content_type='application/json')
        self.assertEqual(response.status_code, status.HTTP_400_BAD_REQUEST)
        self.assertEqual(1, len(response.data))
        self.assertEqual(FOOD_NOT_IN_MENU_ERROR, response.data[0])
