# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models

# Create your models here.

class Medicines(models.Model):
    name = models.CharField(max_length=50)
    price = models.IntegerField()
    quantityAvailable = models.IntegerField()

    def __str__(self):
        return self.name