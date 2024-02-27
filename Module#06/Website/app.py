"""
This Flask application dynamically serves specific HTML pages based on the URL path.
When a user requests /<page>, the show_page function checks if the requested page
is in the list of valid pages (index.html, car.html). If the page is valid, it renders
and serves the corresponding HTML template. If the requested page is not valid,
it returns a "Page not found" message with a 404 HTTP status code.
"""

from flask import Flask, render_template

app = Flask(__name__)


@app.route("/<page>")
def show_page(page):
    valid_pages = ["index.html", "car.html"]
    if page in valid_pages:
        return render_template(page)
    else:
        return "Page not found", 404


if __name__ == "__main__":
    app.run(debug=True)
