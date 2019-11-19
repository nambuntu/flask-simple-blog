from flask import Flask
from flask_migrate import Migrate
from flask_sqlalchemy import SQLAlchemy

from configuration import Configuration

db = SQLAlchemy()


def create_app(config_name):
    app = Flask(__name__)
    # Load configuration
    app.config.from_object(Configuration)

    # Database configuration
    db.init_app(app)
    migrate = Migrate(app, db)

    # Register routes
    from .main import main as main_blueprint
    app.register_blueprint(main_blueprint)

    from app import models
    return app
