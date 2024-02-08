# Python Cheat Sheet

## Data Types

### Basic Types
- **Integers**: `int` - Whole numbers, e.g., `5`
- **Floating Point Numbers**: `float` - Numbers with a decimal point, e.g., `3.14`
- **Strings**: `str` - Text, e.g., `"Hello World"`
- **Booleans**: `bool` - `True` or `False`

### Collection Types
- **Lists**: Ordered, mutable collections, e.g., `[1, 2, 3]`
- **Tuples**: Ordered, immutable collections, e.g., `(1, 2, 3)`
- **Dictionaries**: Key-value pairs, e.g., `{"name": "John", "age": 30}`
- **Sets**: Unordered collection of unique elements, e.g., `{1, 2, 3}`

## Object-Oriented Programming (OOP)

- **Class Definition**
    ```python
    class MyClass:
        def __init__(self, attribute):
            self.attribute = attribute
        
        def method(self):
            return self.attribute
    ```

- **Creating an Object**
    ```python
    my_object = MyClass("value")
    ```

- **Inheritance**
    ```python
    class MySubClass(MyClass):
        def another_method(self):
            return "Another method"
    ```

## Functions

- **Defining a Function**
    ```python
    def my_function(param1, param2):
        return param1 + param2
    ```

- **Lambda Functions**
    ```python
    lambda_function = lambda x, y: x + y
    ```

## JSON Handling

- **Parsing JSON**
    ```python
    import json
    json_string = '{"name": "John", "age": 30}'
    parsed_json = json.loads(json_string)
    ```

- **Converting to JSON**
    ```python
    dict_to_json = json.dumps({"name": "John", "age": 30})
    ```

## REST APIs

- **Making a GET Request**
    ```python
    import requests
    response = requests.get("https://api.example.com/data")
    data = response.json()
    ```

## Built-in Functions

- **`len()`**: Returns the length of an object
- **`print()`**: Prints to the standard output
- **`range()`**: Generates a range of numbers
- **`type()`**: Returns the type of an object
- **`int()`, `str()`, `float()`**: Type conversion

## List Comprehensions

- **Basic Syntax**
    ```python
    [expression for item in iterable if condition]
    ```
    Example:
    ```python
    squares = [x**2 for x in range(10)]
    ```

## Short Comprehension

- **Dictionary Comprehension**
    ```python
    {key: value for key, value in iterable}
    ```
    Example:
    ```python
    square_dict = {x: x**2 for x in range(5)}
    ```

- **Set Comprehension**
    ```python
    {expression for item in iterable if condition}
    ```
    Example:
    ```python
    unique_squares = {x**2 for x in [1, 1, 2]}
    ```
