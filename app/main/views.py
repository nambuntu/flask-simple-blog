from flask import render_template, url_for, request, current_app
from flask_login import login_required

from app.models import Post, User

from . import main


@main.route('/')
@login_required
def index():
    context = {
        'username': 'Nam Nguyen',
        'posts': []
    }
    return render_template(
        'index.html',
        **context
    )


@main.route('/user/<username>')
def user(username):
    user = User.query.filter_by(username=username).first_or_404()
    page = request.args.get('page', 1, type=int)
    pagination = user.posts.order_by(Post.timestamp.desc()).paginate(
        page, per_page=current_app.config['POSTS_PER_PAGE'],
        error_out=False
    )
    posts = pagination.items
    return render_template('user.html', user=user, posts=posts, pagination=pagination)
