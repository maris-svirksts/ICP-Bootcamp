# Python, Flask application.

## Initialize a Flask Application
A new Flask app is created.

## Static List of Cars
A predefined list of cars is defined with each car having an `id` and a `make`.

## Routes
- A route at the root (`/`) that returns a welcome message.
- A route (`/new`) with a `GET` method to list all cars.
- A route (`/new`) with a `POST` method to add a new car to the list.
- A route (`/new/<int:car_id>`) with a `GET` method to fetch a specific car by its `id`.
- A route (`/new/<int:car_id>`) with a `PUT` method to update a specific car by its `id`.
- A route (`/new/<int:car_id>`) with a `DELETE` method to delete a specific car by its `id`.

## CRUD Operations
The application supports creating, reading, updating, and deleting car entries from the list.

## Running the Application
Finally, it sets up the Flask application to run with debugging enabled if the script is executed as the main program.

```bash python .\app.py``` or ```bash flask run --port=80```


```python
from flask import Flask, jsonify, request

app = Flask(__name__)

cars = [
    {"id": 1, "make": "Ford"},
    {"id": 2, "make": "Ferrari"}
]

@app.route('/')
def say_hello():
    return jsonify({"message": "Welcome to my Application!"})

@app.route('/new', methods=['GET'])
def list_all_cars():
    return jsonify(cars)

@app.route('/new', methods=['POST'])
def update_cars():
    print(request)
    data = request.json
    cars.append(data)
    response_data = {'status': 'posted successfully'}
    return jsonify(response_data)

@app.route('/new/<int:car_id>', methods=['GET'])
def list_cars(car_id):
    car = [car for car in cars if car['id'] == car_id]
    return jsonify(car[0]) if car else ('', 404)

@app.route('/new/<int:car_id>', methods=['PUT'])
def update_car(car_id):
    car = [car for car in cars if car['id'] == car_id]
    if not car:
        return jsonify({'message': 'Car not found'}), 404

    # Update car data
    car[0].update(request.json)
    return jsonify(car[0])

@app.route('/new/<int:car_id>', methods=['DELETE'])
def delete_car(car_id):
    global cars
    car = [car for car in cars if car['id'] == car_id]
    if not car:
        return jsonify({'message': 'Car not found'}), 404

    # Remove car from the list
    cars = [car for car in cars if car['id'] != car_id]
    return jsonify({'message': 'Car deleted successfully'})

if __name__ == '__main__':
    app.run(debug=True)
```
