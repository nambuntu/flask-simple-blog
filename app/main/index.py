from flask import render_template, url_for
from . import main


@main.route('/')
def index():
    context = {
        'username': 'Nam Nguyen'
    }
    return render_template(
        'index.html',
        **context
    )
