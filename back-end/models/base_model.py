#!/usr/bin/python3
from datetime import datetime
import models
from uuid import uuid4
from sqlalchemy.ext.declarative import  declarative_base
Base=declarative_base()
class BaseModel:
    def __init__(self,*args,**kwargs):
        if kwargs:
            kwargs['id']=str(uuid4())
            for key, value in kwargs.items():
                setattr(self, key, value)
    def create(self):
        pass

    def read(self):
        pass

    def update(self):
        pass

    def delete(self):
        pass

    def __str__(self):
        """String representation of the BaseModel class"""
        return "[{:s}] ({:s}) {}".format(self.__class__.__name__, self.id,self.__dict__)
    def __repr__(self):
        pass
    def __del__(self):
        pass
    def save(self):
        models.storage.new(self)
        models.storage.save()