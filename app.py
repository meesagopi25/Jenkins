from flask import Flask, jsonify

app = Flask(__name__)

@app.route("/")
def hello():
    return "Hello from Flask on OpenShift Sandbox!", 200

@app.route("/health")
def health():
    return jsonify(status="UP"), 200

if __name__ == "__main__":
    # Listen on all interfaces, port 5000 (matches Dockerfile & Kubernetes)
    app.run(host="0.0.0.0", port=5000)

