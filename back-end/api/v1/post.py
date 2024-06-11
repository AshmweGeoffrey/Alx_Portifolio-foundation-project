from flask import Flask, request, jsonify

app = Flask(__name__)

@app.route('/data', methods=['POST'])
def receive_data():
    data = request.get_json()  # Get the JSON data from the request
    if data:
        # Process the data as needed
        response = {
            "message": "Data received successfully",
            "received_data": data
        }
        return jsonify(response), 200
    else:
        return jsonify({"error": "No data provided"}), 400

if __name__ == '__main__':
    app.run(debug=True)
