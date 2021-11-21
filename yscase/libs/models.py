from django.db import models
from django.utils.translation import ugettext_lazy as _

from yscase.libs.managers import TimestampedModelManager


class TimestampedModel(models.Model):
    created_at = models.DateTimeField(_('CREATED_AT'), auto_now_add=True)
    modified_at = models.DateTimeField(_('MODIFIED_AT'), auto_now=True)
    deleted_at = models.DateTimeField(_('DELETED_AT'), null=True, blank=True)

    objects = TimestampedModelManager()

    class Meta:
        abstract = True


class TimestampedModelWithIndex(models.Model):
    created_at = models.DateTimeField(
        _('created at'),
        auto_now_add=True,
        db_index=True
    )
    modified_at = models.DateTimeField(
        _('modified at'),
        auto_now=True,
        db_index=True
    )
    deleted_at = models.DateTimeField(_('DELETED_AT'), null=True, blank=True)

    objects = TimestampedModelManager()

    class Meta:
        abstract = True
