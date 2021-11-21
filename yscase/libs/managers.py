from django.db.models import Manager
from django.utils import timezone


class TimestampedModelManager(Manager):
    """
    Custom rules for brokers comments
    """

    def get_queryset(self):
        return super().get_queryset().filter(deleted_at__isnull=True)

    def delete(self, *args, **kwargs):
        self.deleted_at = timezone.now()
        self.save()
