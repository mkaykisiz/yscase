import logging
import uuid
from decimal import Decimal

from django.db import models
from django.db.models import CASCADE
from django.utils.translation import ugettext_lazy as _

from yscase.libs.models import TimestampedModelWithIndex
from yscase.food.models import Food
from yscase.restaurant.models import Restaurant
from yscase.user.models import User

logger = logging.getLogger(__name__)

CREATED = 'created'
WAITING = 'waiting'
COMPLETED = 'completed'


class Order(TimestampedModelWithIndex):
    STATUSES = (
        (CREATED, _('Created')),
        (WAITING, _('Waiting')),
        (COMPLETED, _('Completed')),
    )
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
    status = models.CharField(_('Status'),
                              max_length=20,
                              choices=STATUSES,
                              default=CREATED,
                              db_index=True)

    class Meta:
        ordering = ['-created_at']
        verbose_name = _('Order')
        verbose_name_plural = _('Orders')

    def __str__(self):
        return f'{self.order_token} {self.user.get_full_name()}' \
               f' {self.created_at.utcnow()}'

    def update_status_waiting(self):
        self.status = WAITING

    def update_status_completed(self):
        self.status = COMPLETED


class OrderFood(TimestampedModelWithIndex):
    order = models.ForeignKey(Order,
                              verbose_name=_('Order'),
                              related_name='order_foods',
                              on_delete=CASCADE,
                              db_index=True)
    food = models.ForeignKey(Food,
                             verbose_name=_('Food'),
                             on_delete=CASCADE,
                             db_index=True)
    total = models.PositiveSmallIntegerField(verbose_name=_('Total'),
                                             default=1)
    price = models.DecimalField(_('Price'),
                                max_digits=6,
                                decimal_places=2,
                                default=Decimal('0.0'))

    class Meta:
        ordering = ['order', 'food']
        verbose_name = _('Order Item')
        verbose_name_plural = _('Order Items')
        indexes = [
            models.Index(fields=['order', 'food']),
        ]

    def __str__(self):
        return f'{self.order} {self.food}'

    def save(self, *args, **kwargs):
        menu_food = self.order.restaurant.menu_set.filter(
            food=self.food).first()
        if not menu_food:
            logger.info("[OrderFood] Restaurant hasn't this food!")
            raise ValueError(
                "Restaurant hasn't this food!"
            )
        self.price = self.total * menu_food.amount
        return super(OrderFood, self).save(*args, **kwargs)
