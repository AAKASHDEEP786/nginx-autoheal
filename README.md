# 🩺 Self-Healing Infrastructure with Prometheus, Alertmanager & Ansible

This project demonstrates an **auto-healing infrastructure** setup using **Prometheus**, **Alertmanager**, **Ansible**, and **NGINX**.  
Whenever a monitored service (like NGINX) fails or stops responding, an alert is triggered automatically — which then executes an **Ansible playbook** to recover the service.

---

## 📘 Project Overview

### 🎯 Objective
Automatically detect service failures (NGINX down) and recover them using alerts and automation.

### 🧰 Tools Used
- **Prometheus** – Metrics monitoring
- **Alertmanager** – Alert handling and webhook trigger
- **NGINX** – Example service to monitor
- **Ansible** – Automated recovery playbooks
- **Shell Scripts** – For automation and service startup
- **Ubuntu / WSL** – Environment

---

## 🚀 Setup & Run

### 1️⃣ Clone the repo
```bash
git clone https://github.com/AAKASHDEEP786/nginx-autoheal.git
cd nginx-autoheal
```
### 2️⃣ Download and setup binaries
```bash
chmod +x download_binaries.sh
./download_binaries.sh
```
### 3️⃣ Start all monitoring services
```bash
chmod +x start_all.sh
./start_all.sh
```
### 4️⃣ Verify

Nginx Server  → http://localhost

Prometheus → http://localhost:9090

Nginx metrics → http://localhost:9113

Alertmanager → http://localhost:9093

---

🧠 How It Works

1. Prometheus scrapes metrics from:

   •  NGINX (via exporter)

   •  Itself (self-monitoring)

2. If NGINX is down, a rule in rules.yml fires an alert.

3. Alertmanager receives the alert and sends a webhook request to webhook.py.

4. The webhook triggers an Ansible playbook:
```bash
ansible-playbook ansible/restart_nginx.yml
```

which restarts the NGINX service automatically.

---

🧑‍💻 Author

Aakash Deep
DevOps Engineer | AWS | Terraform | Jenkins | Kubernetes | CI/CD Automation

📧 akashdeep960@gmail.com
