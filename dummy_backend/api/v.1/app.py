from flask import Flask, request, jsonify
app = Flask(__name__)
@app.route('/api/v.1/hello', methods=['GET'])
def hello():
    return jsonify({'message': 'comming soon!'})