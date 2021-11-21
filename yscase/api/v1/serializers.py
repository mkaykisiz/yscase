# Serializers define the API representation.
from rest_framework import serializers

from yscase.food.models import Food
from yscase.order.models import Order, OrderFood


class FoodSerializer(serializers.ModelSerializer):
    class Meta:
        model = Food
        fields = ('name', 'cover_image')


class OrderFoodSerializer(serializers.ModelSerializer):
    class Meta:
        model = OrderFood
        fields = ('food', 'total', 'price')
        read_only_fields = ('price',)

    def to_representation(self, instance):
        representation = super(OrderFoodSerializer, self).to_representation(
            instance)
        representation['food'] = instance.food.name
        return representation


class OrderSerializer(serializers.ModelSerializer):
    order_items = OrderFoodSerializer(required=True, many=True,
                                      source='order_foods')

    class Meta:
        model = Order
        exclude = ('deleted_at',)
        read_only_fields = ('order_token', 'status', 'created_at',
                            'modified_at',)

    def create(self, validated_data):
        try:
            order_items = validated_data.pop('order_foods')
            instance = Order.objects.create(**validated_data)
            for order_item in order_items:
                instance.order_foods.create(**order_item)
            return instance
        except Exception as e:
            raise serializers.ValidationError(e)

    def to_representation(self, instance):
        representation = super(OrderSerializer, self).to_representation(
            instance)
        representation['order_items'] = OrderFoodSerializer(
            instance.order_foods.all(), many=True).data
        return representation

    @staticmethod
    def validate_order_items(value):
        if not value:
            raise serializers.ValidationError("You must send food!")
        return value


class OrderProcessSerializer(serializers.ModelSerializer):
    order_items = OrderFoodSerializer(required=True, many=True,
                                      source='order_foods')

    class Meta:
        model = Order
        exclude = ('deleted_at',)
        read_only_fields = ('order_token', 'status', 'created_at',
                            'modified_at',)

    def to_representation(self, instance):
        representation = super(OrderProcessSerializer, self).to_representation(
            instance)
        representation['order_items'] = OrderFoodSerializer(
            instance.order_foods.all(), many=True).data
        return representation
