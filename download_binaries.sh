#!/bin/bash

set -e  # stop script on error
mkdir -p binaries
cd binaries

echo "⬇️ Downloading Prometheus..."
wget -q https://github.com/prometheus/prometheus/releases/download/v3.6.0/prometheus-3.6.0.linux-amd64.tar.gz
tar xvf prometheus-3.6.0.linux-amd64.tar.gz
mv prometheus-3.6.0.linux-amd64/prometheus .
rm -rf prometheus-3.6.0.linux-amd64 prometheus-3.6.0.linux-amd64.tar.gz

echo "⬇️ Downloading Alertmanager..."
wget -q https://github.com/prometheus/alertmanager/releases/download/v0.28.1/alertmanager-0.28.1.linux-amd64.tar.gz
tar xvf alertmanager-0.28.1.linux-amd64.tar.gz
mv alertmanager-0.28.1.linux-amd64/alertmanager .
rm -rf alertmanager-0.28.1.linux-amd64 alertmanager-0.28.1.linux-amd64.tar.gz

echo "⬇️ Downloading NGINX Prometheus Exporter..."
wget -q https://github.com/nginxinc/nginx-prometheus-exporter/releases/download/v0.11.0/nginx-prometheus-exporter_0.11.0_linux_amd64.tar.gz
tar xvf nginx-prometheus-exporter_0.11.0_linux_amd64.tar.gz

# move only if it's inside a folder (safe check)
if [ -d "nginx-prometheus-exporter_0.11.0_linux_amd64" ]; then
    mv nginx-prometheus-exporter_0.11.0_linux_amd64/nginx-prometheus-exporter .
    rm -rf nginx-prometheus-exporter_0.11.0_linux_amd64
fi

rm -f nginx-prometheus-exporter_0.11.0_linux_amd64.tar.gz

echo "✅ All binaries downloaded successfully!"
cd ..
