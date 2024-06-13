from flask import Flask, render_template,redirect, request, jsonify, session
from requests import get
app = Flask(__name__)
app.config['SECRET_KEY'] ='a881f5413500986cbd88e99456623f51e6ccde187d2e399a3f4fdcfa72008b74'
app.static_folder = 'static'
@app.errorhandler(404)
def not_found(error):
    return render_template('404.html'), 404
@app.route('/login', methods=['POST','GET'])
def login():
    if request.method == 'POST':
        # Get form data from the request
        username = request.form.get('username')
        password = request.form.get('password')
        users=get('http://localhost:5000/api/v1/post/login').json()
        # Fetch user data from the database
        # Check if the provided credentials are valid
        if username in users and users[username] == password:
            session['user'] = username
            return redirect('/home')
        # Return an error message for invalid credentials
        else:
            return render_template('login.html', error='Invalid username or password')
    else:
        return render_template('login.html')
@app.route('/home')
def main():
    if 'user' not in session:
        # User is not logged in, redirect to the login page
        return redirect('/login')
    send_inventory=get('http://localhost:5000/api/v1/inventory').json()
    send=get('http://localhost:5000/api/v1/user/{}'.format(session['user'])).json()
    send_category=get('http://localhost:5000/api/v1/category').json()
    send_branch=get('http://localhost:5000/api/v1/branch').json()
    return render_template('home.html',x=send,p=send_inventory,n=send_category,l=send_branch)
@app.route('/sales')
def sales():
    if 'user' not in session:
        # User is not logged in, redirect to the login page
        return redirect('/login')
    send_sales=get('http://localhost:5000/api/v1/sales').json()
    return render_template('sales.html',x=send_sales)
@app.route('/pie')
def pie():
    if 'user' not in session:
        # User is not logged in, redirect to the login page
        return redirect('/login')
    send_days=dict(get('http://localhost:5000/api/v1/pie/days').json())
    send_total_weeekly_items=get('http://localhost:5000/api/v1/pie/total_weeekly_items').json()
    send_category_percentage=dict(get('http://localhost:5000/api/v1/category/percentage').json())
    send_best_selling=get('http://localhost:5000/api/v1/pie/best_selling').json()
    send_out_going=get('http://localhost:5000/api/v1/pie/out_going').json()
    send_payment=get('http://localhost:5000/api/v1/pie/payment').json()
    return render_template('pie.html',x=send_category_percentage,total_weekly=send_total_weeekly_items,days=send_days,best=send_best_selling,out_going=send_out_going,pay=send_payment)
@app.route('/inventory')
def inventory():
    if 'user' not in session:
        # User is not logged in, redirect to the login page
        return redirect('/login')
    send_inventory=get('http://localhost:5000/api/v1/inventory').json()
    return render_template('inventory.html',x=send_inventory)
@app.route('/out_going')
def out_going():
    if 'user' not in session:
        # User is not logged in, redirect to the login page
        return redirect('/login')
    send_out_going=get('http://localhost:5000/api/v1/out_going').json()
    return render_template('out_going.html',x=send_out_going)
@app.route('/')
def index():
    return render_template('index.html')
@app.route('/logout')
def login_init():
    session.pop('user', None)
    return redirect('/login')
if __name__ == '__main__':
    app.run(host='localhost', port=5001)