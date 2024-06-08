#!/usr/bin/python3
from sqlalchemy import Column, Integer, String, ForeignKey, DateTime
from sqlalchemy.orm import relationship
from models.base_model import BaseModel ,Base
class category(BaseModel,Base):
    __tablename__='category'
    id=Column(String(50), primary_key=True)
    category_name=Column(String(32), nullable=False,unique=True)
    percentage=Column(String(16), nullable=False)
    def __init__(self,*args,**kwargs):
        super().__init__(*args,**kwargs)