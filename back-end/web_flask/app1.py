from flask import Flask, render_template
from requests import get
app = Flask(__name__)
app.static_folder = 'static'
@app.route('/')
def main():
    send=get('http://localhost:5000/api/v1/inventory').json()
    return render_template('inventory.html',x=send)
if __name__ == '__main__':
    app.run(host='localhost', port=5001)