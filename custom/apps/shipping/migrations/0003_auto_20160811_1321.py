# -*- coding: utf-8 -*-
# Generated by Django 1.9.9 on 2016-08-11 17:21
from __future__ import unicode_literals

from decimal import Decimal
import django.core.validators
from django.db import migrations, models
import oscar.models.fields.autoslugfield


class Migration(migrations.Migration):

    dependencies = [
        ('address', '0001_initial'),
        ('shipping', '0002_auto_20150604_1450'),
    ]

    operations = [
        migrations.CreateModel(
            name='ShippingCompany',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('code', oscar.models.fields.autoslugfield.AutoSlugField(blank=True, editable=False, max_length=128, populate_from=b'name', unique=True, verbose_name='Slug')),
                ('name', models.CharField(max_length=128, unique=True, verbose_name='Name')),
                ('description', models.TextField(blank=True, verbose_name='Description')),
                ('default_weight', models.DecimalField(decimal_places=3, default=Decimal('0.000'), help_text='Default product weight in kg when no weight attribute is defined', max_digits=12, validators=[django.core.validators.MinValueValidator(Decimal('0.00'))], verbose_name='Default Weight')),
                ('api_user', models.CharField(blank=True, max_length=64, verbose_name='API username')),
                ('api_key', models.CharField(blank=True, max_length=255, verbose_name='API key')),
                ('api_type', models.CharField(blank=True, max_length=10, verbose_name='API type')),
                ('origin', models.CharField(blank=True, default=b'Saint-Petersburg', max_length=255, verbose_name='City of origin')),
                ('is_active', models.BooleanField(default=False, help_text='Use this method in checkout?', verbose_name='active')),
                ('status', models.CharField(blank=True, choices=[(b'online', 'Online'), (b'offline', 'Offline'), (b'disabled', 'Disabled')], max_length=10, verbose_name='status')),
                ('payment_type', models.CharField(blank=True, choices=[(b'prepaid', 'Order includes shipping charges'), (b'postpaid', 'Shipping is paid by buyer')], default=b'postpaid', max_length=10, verbose_name='payment type')),
            ],
            options={
                'ordering': ['name'],
                'abstract': False,
                'verbose_name': 'API-based Shipping Method',
                'verbose_name_plural': 'API-based Shipping Methods',
            },
        ),
        migrations.CreateModel(
            name='ShippingContainer',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=128, unique=True, verbose_name='Name')),
                ('description', models.TextField(blank=True, verbose_name='Description')),
                ('image', models.ImageField(blank=True, max_length=255, upload_to=b'images/products/%Y/%m/', verbose_name='Image')),
                ('height', models.DecimalField(decimal_places=3, max_digits=12, validators=[django.core.validators.MinValueValidator(Decimal('0.00'))], verbose_name='Height, m')),
                ('width', models.DecimalField(decimal_places=3, max_digits=12, validators=[django.core.validators.MinValueValidator(Decimal('0.00'))], verbose_name='Width, m')),
                ('lenght', models.DecimalField(decimal_places=3, max_digits=12, validators=[django.core.validators.MinValueValidator(Decimal('0.00'))], verbose_name='Lenght, m')),
                ('max_load', models.DecimalField(decimal_places=3, max_digits=12, validators=[django.core.validators.MinValueValidator(Decimal('0.00'))], verbose_name='Max loading, kg')),
            ],
            options={
                'verbose_name': 'Shipping Container',
                'verbose_name_plural': 'Shipping Containers',
            },
        ),
        migrations.AddField(
            model_name='shippingcompany',
            name='containers',
            field=models.ManyToManyField(blank=True, help_text='Containers or boxes could be used for packing', related_name='containers', to='shipping.ShippingContainer', verbose_name='Containers or boxes'),
        ),
        migrations.AddField(
            model_name='shippingcompany',
            name='countries',
            field=models.ManyToManyField(blank=True, to='address.Country', verbose_name='Countries'),
        ),
    ]
