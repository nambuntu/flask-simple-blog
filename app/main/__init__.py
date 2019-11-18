from flask import Blueprint

main = Blueprint('main', __name__)

from .index import *
from .users import *
