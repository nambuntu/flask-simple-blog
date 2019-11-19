from flask import render_template, flash, redirect, url_for

from app.main.forms import LoginForm
from . import main


@main.route('/users/<path:name>')
def users(name):
    context = {
        "name": name
    }
    return render_template('users.html', **context)


@main.route('/login', methods=['GET', 'POST'])
def login():
    form = LoginForm()
    if form.validate_on_submit():
        flash('Login requested for user {}, remember_me={}'.format(
            form.username.data, form.remember_me.data))
        return redirect(url_for('main.index'))
    return render_template('login.html', title='Sign In', form=form)
