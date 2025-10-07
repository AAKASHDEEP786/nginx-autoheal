#!/bin/bash
echo "🚀 Starting all monitoring services..."

# Start NGINX
sudo systemctl start nginx

# Start NGINX exporter
~/nginx-prometheus-exporter_0.11.0_linux_amd64/nginx-prometheus-exporter --nginx.scrape-uri http://localhost/nginx_status &

# Start Prometheus
~/prometheus-3.6.0.linux-amd64/prometheus --config.file=~/nginx-autoheal/prometheus/prometheus.yml &

# Start Alertmanager
~/alertmanager-0.28.1.linux-amd64/alertmanager --config.file=~/nginx-autoheal/alertmanager/alertmanager.yml &

# Start Flask webhook
cd ~/nginx-autoheal/webhook
python3 webhook.py &
