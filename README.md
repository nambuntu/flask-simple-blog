## To import/export environment
Import:
```bash
pip install -r requirements.txt
```
Export: 
```bash
pip freeze > requirements.txt
```

## Database migration
```bash
flask db migrate -m "users table"
flask db migrate -m "posts table"
flask db upgrade
```

## Activate Flask shell for testing
First, enter the flask shell (need to activate Python from venv)
```bash
venv\Scripts\activate
set FLASK_APP=app.py
flask shell
```

Then run the following Python code
```python
from app import db
from app.models import User, Post
u = User(username='namnvhue', email='namnvhue@gmail.com')
db.session.add(u)
db.session.commit()
users = User.query.all()
```

## Some Utilities
Password hash and check password hash
```python
from werkzeug.security import generate_password_hash
hash = generate_password_hash('foobar')
hash
from werkzeug.security import check_password_hash
check_password_hash(hash, 'foobar')
check_password_hash(hash, 'barfoo')
```