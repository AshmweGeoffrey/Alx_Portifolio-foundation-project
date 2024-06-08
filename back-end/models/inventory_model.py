#!/usr/bin/python
from sqlalchemy import Column, Integer, String, ForeignKey, DateTime
from models.base_model import BaseModel ,Base
from datetime import datetime
from models.category import category
class inventory(BaseModel,Base):
    __tablename__='inventory'
    id=Column(String(50), primary_key=True)
    name=Column(String(64),unique=True,nullable=False)
    category_name=Column(String(32),ForeignKey('category.category_name'),unique=True,nullable=False)
    inventory_quantity=Column(Integer,nullable=False,default=0)
    incoming_time_stamp=Column(DateTime,nullable=True)
    def __init__(self,*args,**kwargs):
        kwargs['incoming_time_stamp']=datetime.now()
        super().__init__(*args,**kwargs)