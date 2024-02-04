
# Object-Oriented Programming (OOP)

Object-Oriented Programming (OOP) is a programming paradigm based on the concept of "objects", which can contain data, in the form of fields (often known as attributes or properties), and code, in the form of procedures (often known as methods). OOP aims to implement real-world entities like inheritance, hiding, polymorphism etc. in programming. The main principles of OOP are to make the software more modular, flexible, and intuitive to develop and maintain.

## Key Concepts of OOP

### 1. Class
A blueprint for creating objects (a particular data structure), providing initial values for state (member variables or attributes), and implementations of behavior (member functions or methods).

### Example:
```python
class Car:
    def __init__(self, brand, model):
        self.brand = brand
        self.model = model
```

### 2. Object
An instance of a class. This is the realized version of the class, where the class is manifested in the program.

### Example:
```python
my_car = Car("Toyota", "Corolla")
```

### 3. Inheritance
A mechanism in which one class acquires the properties (methods and fields) of another class.

### Example:
```python
class ElectricCar(Car):
    def __init__(self, brand, model, battery_size):
        super().__init__(brand, model)
        self.battery_size = battery_size
```

### 4. Encapsulation
The bundling of data, along with the methods that operate on that data, into a single unit or class. Encapsulation also means restricting access to the inner workings of that class.

### Example:
```python
class Person:
    def __init__(self, name, age):
        self.name = name
        self._age = age  # Note the use of underscore for making age somewhat private
    
    def get_age(self):
        return self._age
```

### 5. Polymorphism
The provision of a single interface to entities of different types. A polymorphic type is one that can appear to be of a class or any of its subclasses.

### Example:
```python
def car_description(car: Car):
    print(f"The car is a {car.brand} {car.model}")
```

By employing these principles, developers can create programs that are more dynamic and flexible, making it easier to extend and maintain the code.

