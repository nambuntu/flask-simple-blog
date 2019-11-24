from flask import render_template, url_for, request, current_app, flash, redirect
from flask_login import login_required, current_user

from app import db
from app.main.forms import PostForm
from app.models import Post, User

from . import main


@main.route('/', methods=['GET','POST'])
@login_required
def index():
    form = PostForm()
    if form.validate_on_submit():
        post = Post(body=form.post.data,
                    user_id=current_user.id)
        db.session.add(post)
        db.session.commit()
        flash('Your post is now alive')
        return redirect(url_for('main.index'))
    page = request.args.get('page', 1, type=int)
    query = Post.query
    pagination = query.order_by(Post.timestamp.desc()).paginate(
        page, per_page=current_app.config['POSTS_PER_PAGE'],
        error_out=False)
    posts = pagination.items
    return render_template('index.html', form=form, posts=posts, pagination=pagination)


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
