from flask_wtf import FlaskForm
from wtforms import TextAreaField, SubmitField
from wtforms.validators import DataRequired, length


class PostForm(FlaskForm):
    post = TextAreaField('Share something with the community', validators=[
        DataRequired(), length(min=1, max=140)
    ])
    submit = SubmitField('Submit')
