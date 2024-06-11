from models.branch import branch
from flask import Blueprint, jsonify, request
from . import api
@api.route('/branch', methods=['GET'])
def get_branch():
    branch_1= branch().select_all()
    return jsonify(branch_1)