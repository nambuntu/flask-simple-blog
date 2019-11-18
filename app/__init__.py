from flask import Flask
from configuration import Configuration


def create_app(config_name):
    app = Flask(__name__)
    app.config.from_object(Configuration)
    from .main import main as main_blueprint
    app.register_blueprint(main_blueprint)
    return app
