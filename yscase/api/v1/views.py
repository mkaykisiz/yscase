import logging

from django_filters.rest_framework import DjangoFilterBackend
from rest_framework import mixins, status
from rest_framework.response import Response
from rest_framework.viewsets import GenericViewSet

from yscase.api.v1.serializers import OrderSerializer, OrderProcessSerializer
from yscase.libs.redis_conn import RedisConn
from yscase.order.models import Order

logger = logging.getLogger(__name__)


class OrderViewSet(mixins.CreateModelMixin,
                   mixins.RetrieveModelMixin,
                   mixins.ListModelMixin,
                   GenericViewSet):
    queryset = Order.objects.all()
    serializer_class = OrderSerializer
    filter_backends = [DjangoFilterBackend]
    filterset_fields = ['status']
    lookup_field = 'order_token'

    def create(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        self.perform_create(serializer)
        # publish order token
        self.set_order_to_publish(str(serializer.instance.order_token))

        serializer.instance.update_status_waiting()
        serializer.instance.save()
        headers = self.get_success_headers(serializer.data)
        return Response(serializer.data,
                        status=status.HTTP_201_CREATED,
                        headers=headers)

    def set_order_to_publish(self, order_token):
        """
        Publish order to channel
        :order_token: Order pk id
        """
        RedisConn().pub(order_token)


class OrderProcessViewSet(mixins.ListModelMixin,
                          GenericViewSet):
    queryset = Order.objects.all()
    serializer_class = OrderProcessSerializer

    def list(self, request, *args, **kwargs):
        # Catch order token
        order_token = self.get_order_from_subscription()
        if order_token:
            order = self.queryset.filter(order_token=order_token).first()
            if order:
                # update status
                order.update_status_completed()
                order.save()
                serializer = self.get_serializer(instance=order)
                return Response(serializer.data)
            logger.info(f"[OrderProcessViewSet]"
                        f" Wrong order_token: {order_token}")
            return Response(status=400, data={'error': 'Order Token is Wrong!'})

        logger.info("[OrderProcessViewSet] Subscription not found order_token")
        return Response(status=400, data={'error': 'Order Token Not Found!'})

    def get_order_from_subscription(self):
        """
        Subscribe order channel and get token
        :return: order_token str
        """
        return RedisConn().sub()
