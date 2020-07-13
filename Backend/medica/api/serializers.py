from rest_framework import serializers
from .models import Medicines


class medserialize(serializers.ModelSerializer):
    class Meta:
        model = Medicines
        fields = '__all__'