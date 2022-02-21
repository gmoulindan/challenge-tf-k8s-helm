from flask import Flask, request
from logic import check_prime
app = Flask(__name__)


@app.route('/api/prime/<number>')
def index(number):
    prime=check_prime(int(number))
    return str(prime)

@app.route('/health')
def health():
    return "Everything is OK!"

app.run(host='0.0.0.0', port=80)
