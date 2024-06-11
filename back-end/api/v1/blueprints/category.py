from models.category import category
from flask import Blueprint, jsonify, request
from . import api
@api.route('/category', methods=['GET'])
def get_category():
    category_1= category().select_all()
    return jsonify(category_1)