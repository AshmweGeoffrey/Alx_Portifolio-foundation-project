from flask import Blueprint, jsonify, request
from models.inventory_model import inventory
from . import api
from flask_cors import CORS

CORS(api)

@api.route('/post/new_item', methods=['POST'])
def post_new_item():
    # Get form data from the request
    name = request.form.get('item-name')
    category = request.form.get('category')
    quantity = request.form.get('quantity')

    # Process the data as needed
    # For example, you can save it to a database

    # Return a JSON response
    response = {
            'name': name,
            'category_name': category,
            'inventory_quantity': int(quantity)
        }
    print(response)
    inv=inventory(**response)
    inv.save()
    return jsonify(response)