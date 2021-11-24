# Generated by Django 3.2.9 on 2021-11-24 22:06

from decimal import Decimal
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('restaurant', '0004_remove_menu_item_count'),
    ]

    operations = [
        migrations.AddField(
            model_name='menu',
            name='amount',
            field=models.DecimalField(decimal_places=2, default=Decimal('0.0'), max_digits=6, verbose_name='Amount'),
        ),
    ]