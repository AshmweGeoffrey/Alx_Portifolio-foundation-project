from flask import Blueprint
api = Blueprint('api', __name__,url_prefix='/api/v1')
from api.v1.blueprints.inventory import *
from api.v1.blueprints.sales import *
from api.v1.blueprints.outgoing import *
from api.v1.blueprints.user import *