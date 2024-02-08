# Flask Cheat Sheet

Flask is a lightweight WSGI (Web Server Gateway Interface) web application framework. It's designed to make getting started with web development quick and easy, with the ability to scale up to complex applications.

## Getting Started

### Installation

Install Flask using pip:

```bash
pip install Flask
```

### Basic Application

Create a file, for example, `app.py`, and add the following code to define a basic Flask application:

```python
from flask import Flask
app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Hello, World!'
```

### Running the Application

Run your Flask application by executing:

```bash
export FLASK_APP=app.py
flask run
```

For Windows CMD, use `set` instead of `export`:

```cmd
set FLASK_APP=app.py
flask run
```

## Routing

Define routes to handle different endpoints:

```python
@app.route('/about')
def about():
    return 'About Page'
```

### Variable Rules

Capture values from the URL:

```python
@app.route('/user/<username>')
def show_user_profile(username):
    return f'User {username}'
```

### HTTP Methods

Specify allowed methods:

```python
@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        return do_the_login()
    else:
        return show_the_login_form()
```

## Templates

Use Jinja2 templates to render HTML:

### Rendering Templates

First, ensure your templates are in the `templates` folder. Then:

```python
from flask import render_template

@app.route('/hello/<name>')
def hello(name):
    return render_template('hello.html', name=name)
```

### Template Example (`hello.html`)

```html
<!DOCTYPE html>
<html>
<head>
    <title>Hello Template</title>
</head>
<body>
    <h1>Hello, {{ name }}!</h1>
</body>
</html>
```

## Static Files

Place static files like CSS and JavaScript in the `static` folder. Access them in templates using:

```html
<link rel="stylesheet" href="{{ url_for('static', filename='style.css') }}">
```

## Form Data

Handle form data:

```python
from flask import request

@app.route('/submit', methods=['POST'])
def submit():
    title = request.form['title']
    description = request.form['description']
    return f'Title: {title}, Description: {description}'
```

## Flask Extensions

Extend Flask's functionality with extensions for tasks like form validation, database integration, authentication, and more.

- Flask-SQLAlchemy for ORM.
- Flask-WTF for forms.
- Flask-Login for user authentication.

## Debug Mode

Enable debug mode for development:

```bash
export FLASK_ENV=development
flask run
```

Or in Windows CMD:

```cmd
set FLASK_ENV=development
flask run
```
