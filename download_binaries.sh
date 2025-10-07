#!/bin/bash
mkdir -p binaries
cd binaries
wget https://github.com/prometheus/prometheus/releases/download/v3.6.0/prometheus-3.6.0.linux-amd64.tar.gz
tar xvf prometheus-3.6.0.linux-amd64.tar.gz
mv prometheus-3.6.0.linux-amd64/prometheus .
wget https://github.com/prometheus/alertmanager/releases/download/v0.28.1/alertmanager-0.28.1.linux-amd64.tar.gz
tar xvf alertmanager-0.28.1.linux-amd64.tar.gz
mv alertmanager-0.28.1.linux-amd64/alertmanager .
wget https://github.com/nginxinc/nginx-prometheus-exporter/releases/download/v0.11.0/nginx-prometheus-exporter_0.11.0_linux_amd64.tar.gz
tar xvf nginx-prometheus-exporter_0.11.0_linux_amd64.tar.gz
mv nginx-prometheus-exporter_0.11.0_linux_amd64/nginx-prometheus-exporter .
cd ..
