import logging

from django.test import TestCase
from django.urls import reverse
from rest_framework import status

logger = logging.getLogger(__name__)


class TestGetOrders(TestCase):
    fixtures = ["yscase/api/v1/fixture.json"]

    def test_success_new_order(self):
        url = reverse('orders-list')
        response = self.client.get(url)
        self.assertEqual(2, len(response.data))
        self.assertEqual(response.status_code, status.HTTP_200_OK)
