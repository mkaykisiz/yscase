# Generated by Django 3.2.9 on 2021-11-22 21:12

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('order', '0006_rename_price_orderfood_price'),
    ]

    operations = [
        migrations.AlterField(
            model_name='orderfood',
            name='order',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='order_foods', to='order.order', verbose_name='Order'),
        ),
    ]
