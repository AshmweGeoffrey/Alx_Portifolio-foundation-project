from flask import Blueprint, jsonify, request
from models.sale_weekly import sale_weekly
from models import storage
from . import api
@api.route('/pie/total_weeekly_items', methods=['GET'])
def total_weeekly_items():
    total_weeekly_items = storage.command('SELECT SUM(quantity) FROM sale_weekly;').fetchall()
    for i in total_weeekly_items:
        for j in i:
            total_weeekly_items = j
    return jsonify(total_weeekly_items)
@api.route('/pie/days', methods=['GET'])
def days():
    result={'monday':0,'tuesday':0,'wednesday':0,'thursday':0,'friday':0,'saturday':0,'sunday':0}
    x=['monday','tuesday','wednesday','thursday','friday','saturday','sunday']
    days = storage.command('SELECT quantity,time_stamp FROM sale_weekly;').fetchall()
    total=0
    for i in days:
        for j in range(1,7):
            if i[1].weekday() == j:
                total+=i[0]
                result[x[j]] += i[0]
    result['total']=total
    return jsonify(result)
@api.route('/pie/best_selling', methods=['GET'])
def best_selling():
    best_selling = storage.command('SELECT item_name FROM sale_weekly ORDER BY quantity DESC LIMIT 1;').fetchall()
    for i in best_selling:
        for j in i:
            best_selling = j
    return jsonify(best_selling)
@api.route('/pie/out_going', methods=['GET'])
def out_going():
    out_going = storage.command('SELECT SUM(quantity) FROM outgoing_stock;').fetchall()
    for i in out_going:
        for j in i:
            out_going = j
    return jsonify(out_going)
@api.route('/pie/payment', methods=['GET'])
def payment():
    c={}
    payment = storage.command('SELECT name,total_weekly FROM payment_method;').fetchall()
    total = storage.command('SELECT SUM(total_weekly) FROM payment_method;').fetchall()[0][0]
    for pay ,amount in payment:
        c[pay]=amount
    c['total']=total
    return jsonify(c)