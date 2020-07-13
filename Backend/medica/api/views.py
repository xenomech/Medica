# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.http import HttpResponse
from django.shortcuts import get_object_or_404
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from .models import Medicines
from .serializers import medserialize

from django.shortcuts import render

# Create your views here.

class medlist(APIView):

    def get(self,request):
        medall = Medicines.objects.all()
        serializer = medserialize(medall,many=True)
        return Response( serializer.data)


    def post(self):
        pass
