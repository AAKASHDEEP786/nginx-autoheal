from flask import Flask, request
import subprocess

app = Flask(__name__)

@app.route('/', methods=['POST'])
def handle_alert():
    data = request.json
    print("Received alert:", data)
    # Run Ansible playbook when alert received
    subprocess.run(["ansible-playbook", "/home/dev/nginx-autoheal/ansible/restart_nginx.yml"]) # Custom restart nginx file
    return "Alert received", 200

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5001)
