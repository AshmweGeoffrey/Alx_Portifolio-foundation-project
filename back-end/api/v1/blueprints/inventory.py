from models.inventory_model import inventory
from flask import Blueprint, jsonify, request
from . import api
@api.route('/inventory', methods=['GET'])
def get_inventory():
    inventory_1= inventory().select_all()
    return jsonify(inventory_1)