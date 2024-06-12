from flask import Flask, render_template
from requests import get
app = Flask(__name__)
app.static_folder = 'static'
@app.route('/home')
def main():
    send_inventory=get('http://localhost:5000/api/v1/inventory').json()
    send=get('http://localhost:5000/api/v1/user/Bob Johnson').json()
    send_category=get('http://localhost:5000/api/v1/category').json()
    send_branch=get('http://localhost:5000/api/v1/branch').json()
    return render_template('home.html',x=send,p=send_inventory,n=send_category,l=send_branch)
@app.route('/sales')
def sales():
    send_sales=get('http://localhost:5000/api/v1/sales').json()
    return render_template('sales.html',x=send_sales)
@app.route('/pie')
def pie():
    send_days=dict(get('http://localhost:5000/api/v1/pie/days').json())
    send_total_weeekly_items=get('http://localhost:5000/api/v1/pie/total_weeekly_items').json()
    send_category_percentage=dict(get('http://localhost:5000/api/v1/category/percentage').json())
    send_best_selling=get('http://localhost:5000/api/v1/pie/best_selling').json()
    send_out_going=get('http://localhost:5000/api/v1/pie/out_going').json()
    return render_template('pie.html',x=send_category_percentage,total_weekly=send_total_weeekly_items,days=send_days,best=send_best_selling,out_going=send_out_going)
@app.route('/inventory')
def inventory():
    send_inventory=get('http://localhost:5000/api/v1/inventory').json()
    return render_template('inventory.html',x=send_inventory)
@app.route('/out_going')
def out_going():
    send_out_going=get('http://localhost:5000/api/v1/out_going').json()
    return render_template('out_going.html',x=send_out_going)
@app.route('/index')
def index():
    return render_template('index.html')
@app.route('/login')
def login():
    return render_template('login.html')
if __name__ == '__main__':
    app.run(host='localhost', port=5001)