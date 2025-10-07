#!/bin/bash
echo "🚀 Starting all monitoring services..."

# Go to project root
cd "$(dirname "$0")"

# Start NGINX
echo "➡️ Starting NGINX..."
sudo systemctl start nginx

# Start NGINX Prometheus Exporter
echo "➡️ Starting NGINX Prometheus Exporter..."
./binaries/nginx-prometheus-exporter --nginx.scrape-uri http://localhost/nginx_status &

# Start Prometheus
echo "➡️ Starting Prometheus..."
./binaries/prometheus --config.file=./prometheus/prometheus.yml &

# Start Alertmanager
echo "➡️ Starting Alertmanager..."
./binaries/alertmanager --config.file=./alertmanager/alertmanager.yml &

# Start Flask Webhook
echo "➡️ Starting Flask Webhook..."
cd ./webhook
python3 webhook.py &

echo "✅ All monitoring services started successfully!"
