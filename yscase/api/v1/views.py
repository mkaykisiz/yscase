from rest_framework import mixins, status
from rest_framework.response import Response
from rest_framework.viewsets import GenericViewSet

from yscase.api.v1.serializers import OrderSerializer, OrderProcessSerializer
from yscase.order.models import Order


class OrderViewSet(mixins.CreateModelMixin,
                   mixins.RetrieveModelMixin,
                   mixins.ListModelMixin,
                   GenericViewSet):
    queryset = Order.objects.all()
    serializer_class = OrderSerializer
    lookup_field = 'order_token'

    def create(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        self.perform_create(serializer)
        self.set_order_to_publish(serializer.instance.order_token)
        serializer.instance.update_status_waiting()
        serializer.instance.save()
        headers = self.get_success_headers(serializer.data)
        return Response(serializer.data,
                        status=status.HTTP_201_CREATED,
                        headers=headers)

    def set_order_to_publish(self, order_token):
        print(order_token)


class OrderProcessViewSet(mixins.ListModelMixin,
                          GenericViewSet):
    queryset = Order.objects.all()
    serializer_class = OrderProcessSerializer

    def list(self, request, *args, **kwargs):
        order_token = self.get_order_from_subscription()
        if order_token:
            order = self.queryset.filter(order_token=order_token).first()
            if order:
                order.update_status_completed()
                order.save()
                serializer = self.get_serializer(instance=order)
                return Response(serializer.data)
        return Response(status=400, data={'error': 'Order Token is Wrong!'})

    def get_order_from_subscription(self):
        return "4e37d95a-e090-405a-86c7-514a22173c90"
