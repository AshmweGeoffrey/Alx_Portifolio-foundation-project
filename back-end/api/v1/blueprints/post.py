from flask import Blueprint, jsonify, request, redirect, session
from models.inventory_model import inventory
from models.outgoing_stock import outgoing_stock
from models.sale_weekly import sale_weekly
from . import api
from flask_cors import CORS
from models import storage
from requests import get
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
    return "", 204
@api.route('/post/outgoing', methods=['POST'])
def post_outgoing():
    # Get form data from the request
    item_name = request.form.get('item-name')
    #category_name = request.form.get('category')
    quantity = request.form.get('new-item-quantity')
    #user_name = request.form.get('user')
    branch_name = request.form.get('Branch')
    user_name = request.form.get('username')
    # Process the data as needed
    # For example, you can save it to a database

    # Return a JSON response
    response = {
            'item_name': item_name,
            #'category_name': category_name,
            'quantity': int(quantity),
            'user_name': user_name,
            'branch_name': branch_name
        }
    print(response)
    out= outgoing_stock(**response)
    out.save()
    return "", 204
@api.route('/post/sale', methods=['POST'])
def post_sale():
    # Get form data from the request
    item_name = request.form.get('item-name')
    quantity = request.form.get('sale-quantity')
    price = request.form.get('sale-price')
    user_name = request.form.get('username')
    payment_method = request.form.get('Payment')
    #branch_name = request.form.get('Branch')

    # Process the data as needed
    # For example, you can save it to a database

    # Return a JSON response
    response = {
            'item_name': item_name,
            'quantity': int(quantity),
            'price': int(price),
            'user_name': user_name,
            'payment_method': payment_method
        }
    print(response)
    sale= sale_weekly(**response)
    sale.save()
    return "", 204
@api.route('/post/existing', methods=['POST'])
def existing_item():
    # Get form data from the request
    item_name = request.form.get('item-name')
    quantity = request.form.get('Existing-quantity')
    #user_name = request.form.get('user')
    # Process the data as needed
    # For example, you can save it to a database
    # Return a JSON response
    response = {
            'item_name': item_name,
            'quantity': int(quantity)
        }
    res=storage.command("UPDATE inventory SET inventory_quantity = inventory_quantity+{:d} WHERE name='{}'".format(int(quantity),item_name))
    print(res)
    return "", 204
@api.route('/post/login', methods=['GET'])
def login_send():
    res = storage.command("SELECT * FROM user").fetchall()
    users = {user[1]: user[2] for user in res}
    return jsonify(users)