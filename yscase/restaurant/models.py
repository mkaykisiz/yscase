from decimal import Decimal

from django.db import models
from django.db.models import CASCADE
from django.utils.translation import ugettext_lazy as _

from yscase.food.models import Food
from yscase.libs.models import TimestampedModelWithIndex


class RestaurantCategory(TimestampedModelWithIndex):
    title = models.CharField(_('Title'), max_length=200, unique=True,
                             db_index=True)
    slug = models.SlugField(_('Slug'), max_length=200, unique=True,
                            db_index=True)

    class Meta:
        ordering = ['title']
        verbose_name = _('Restaurant Category')
        verbose_name_plural = _('Restaurant Categories')

    def __str__(self):
        return self.title


class Restaurant(TimestampedModelWithIndex):
    name = models.CharField(verbose_name=_('Name'),
                            max_length=200,
                            unique=True,
                            db_index=True)
    category = models.ForeignKey(RestaurantCategory,
                                 verbose_name=_('Category'),
                                 on_delete=CASCADE,
                                 db_index=True)

    class Meta:
        ordering = ['name']
        verbose_name = _('Restaurant')
        verbose_name_plural = _('Restaurants')

    def __str__(self):
        return self.name


class Menu(TimestampedModelWithIndex):
    restaurant = models.ForeignKey(Restaurant,
                                   verbose_name=_('Restaurant'),
                                   on_delete=CASCADE,
                                   db_index=True)
    food = models.ForeignKey(Food, verbose_name=_('Food'),
                             on_delete=CASCADE,
                             db_index=True)

    amount = models.DecimalField(_('Amount'),
                                 max_digits=6,
                                 decimal_places=2,
                                 default=Decimal('0.0'))

    class Meta:
        ordering = ['restaurant', 'food']
        verbose_name = _('Menu Item')
        verbose_name_plural = _('Menu Items')
        indexes = [
            models.Index(fields=['restaurant', 'food']),
        ]

    def __str__(self):
        return f'{self.restaurant} {self.food}'
