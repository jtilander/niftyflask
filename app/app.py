import logging
from flask import Flask
app = Flask(__name__)
app.config['PROPAGATE_EXCEPTIONS'] = True

@app.route('/api/')
def hello_world():
    logging.debug("-" * 100)
    logging.debug('INFO BLOCK - ROOT / hit')
    return 'Hello, World!'

print "-" * 100
print "NiftyFlask sample app starting. v0.0.1"
print "-" * 100
