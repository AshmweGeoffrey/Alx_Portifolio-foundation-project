from flask import Blueprint, jsonify, request
from models.outgoing_stock import outgoing_stock
from . import api
@api.route('/out_going', methods=['GET'])
def get_out_going():
    out_going1= outgoing_stock().select_all()
    return jsonify(out_going1)