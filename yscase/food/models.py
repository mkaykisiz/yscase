from django.db import models
from django.utils.translation import ugettext_lazy as _

from yscase.libs.models import TimestampedModelWithIndex


class Food(TimestampedModelWithIndex):
    name = models.CharField(_('Name'),
                            max_length=200,
                            unique=True,
                            db_index=True)
    cover_image = models.ImageField(_('Cover Image'),
                                    upload_to='food_images',
                                    blank=True)

    class Meta:
        ordering = ['name']
        verbose_name = _('Food')
        verbose_name_plural = _('Foods')

    def __str__(self):
        return self.name
