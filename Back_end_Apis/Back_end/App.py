#blibiotecas
from flask import Flask

import configuration


App = Flask(__name__)


configuration.init_app(App)
configuration.load_extensions(App)


App.run(port=5001)  