import uuid

from django.db import models
from django.db.models import CASCADE
from django.utils.translation import ugettext_lazy as _

from yscase.libs.models import TimestampedModelWithIndex
from yscase.food.models import Food
from yscase.restaurant.models import Restaurant
from yscase.user.models import User


class Order(TimestampedModelWithIndex):
    order_token = models.UUIDField(primary_key=True,
                                   default=uuid.uuid4,
                                   editable=False,
                                   db_index=True)
    user = models.ForeignKey(User,
                             verbose_name=_('User'),
                             on_delete=CASCADE,
                             db_index=True)
    restaurant = models.ForeignKey(Restaurant,
                                   verbose_name=_('Restaurant'),
                                   on_delete=CASCADE,
                                   db_index=True)

    class Meta:
        ordering = ['-created_at']
        verbose_name = _('Order')
        verbose_name_plural = _('Orders')

    def __str__(self):
        return f'{self.order_token} {self.user.get_full_name()}' \
               f' {self.created_at.utcnow()}'


class OrderFood(TimestampedModelWithIndex):
    order = models.ForeignKey(Order,
                              verbose_name=_('Order'),
                              on_delete=CASCADE,
                              db_index=True)
    food = models.ForeignKey(Food,
                             verbose_name=_('Food'),
                             on_delete=CASCADE,
                             db_index=True)

    class Meta:
        ordering = ['order', 'food']
        verbose_name = _('Order Item')
        verbose_name_plural = _('Order Items')
        indexes = [
            models.Index(fields=['order', 'food']),
        ]

    def __str__(self):
        return f'{self.order} {self.food}'
