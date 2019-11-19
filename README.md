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