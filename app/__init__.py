from flask import Flask
from flask_bootstrap import Bootstrap
from flask_login import LoginManager
from flask_migrate import Migrate
from flask_sqlalchemy import SQLAlchemy

from configuration import Configuration

bootstrap = Bootstrap()
# Create db manager
db = SQLAlchemy()

# Create flask login manager
login_manager = LoginManager()
login_manager.login_view = 'auth.login'


def create_app(config_name):
    app = Flask(__name__)
    # Load configuration
    app.config.from_object(Configuration)

    bootstrap.init_app(app)
    # Database configuration
    db.init_app(app)
    migrate = Migrate(app, db)

    # Register routes
    from .main import main as main_blueprint
    app.register_blueprint(main_blueprint)

    from .auth import auth as auth_blueprint
    app.register_blueprint(auth_blueprint, url_prefix='/auth')

    # Register login manager
    login_manager.init_app(app)

    # Import models
    from app import models

    return app
