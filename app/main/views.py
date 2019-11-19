from flask import render_template, url_for
from flask_login import login_required

from . import main


@main.route('/')
@login_required
def index():
    context = {
        'username': 'Nam Nguyen'
    }
    return render_template(
        'index.html',
        **context
    )
