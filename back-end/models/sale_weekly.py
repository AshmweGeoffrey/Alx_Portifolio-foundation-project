from models.base_model import BaseModel,Base
from sqlalchemy import Column, String, Integer, ForeignKey, DateTime
from sqlalchemy.orm import relationship
from datetime import datetime
from models.user import user
from models.inventory_model import inventory
class sale_weekly(BaseModel,Base):
    __tablename__ = 'sale_weekly'
    id = Column(String(50),primary_key=True,nullable=False)
    item_name = Column(String(64),ForeignKey('inventory.name'),unique=True)
    category = Column(String(32),ForeignKey('inventory.category_name'))
    quantity = Column(Integer,nullable=False,default=1)
    price = Column(Integer,nullable=False,default=0)
    user_name = Column(String(32),ForeignKey('user.name'),unique=True)
    time_stamp = Column(DateTime,unique=True)
    def __init__(self,*args,**kwargs):
        kwargs['time_stamp']=datetime.now()
        super().__init__(*args,**kwargs)