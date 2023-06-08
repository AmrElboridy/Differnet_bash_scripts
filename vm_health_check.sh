#!/bin/bash

# Function to check CPU usage
check_cpu_usage() {
  cpu_usage=$(top -bn 1 | grep '%Cpu' | awk '{print $2}')
  if (( $(echo "$cpu_usage > 80.0" | bc -l) )); then
    echo "High CPU usage detected: $cpu_usage%"
  else
    echo "CPU usage is normal: $cpu_usage%"
  fi
}

# Function to check memory usage
check_memory_usage() {
  memory_usage=$(free -m | awk 'NR==2{printf "%.2f%%", $3*100/$2 }')
  if (( $(echo "$memory_usage > 80.0" | bc -l) )); then
    echo "High memory usage detected: $memory_usage"
  else
    echo "Memory usage is normal: $memory_usage"
  fi
}

# Function to check disk usage
check_disk_usage() {
  disk_usage=$(df -h | awk '$NF=="/"{printf "%s", $5}')
  if (( $(echo "$disk_usage > 80.0" | bc -l) )); then
    echo "High disk usage detected: $disk_usage"
  else
    echo "Disk usage is normal: $disk_usage"
  fi
}

# Function to check network connectivity
check_network_connectivity() {
  ping -c 4 google.com > /dev/null
  if [[ $? -eq 0 ]]; then
    echo "Network connectivity is good"
  else
    echo "Network connectivity issues detected"
  fi
}

# Function to check system and application logs for errors
check_logs_for_errors() {
  error_logs=$(grep -i -E "error|exception" /var/log/syslog /var/log/application.log)
  if [[ -n "$error_logs" ]]; then
    echo "Errors found in system and application logs:"
    echo "$error_logs"
  else
    echo "No errors found in system and application logs"
  fi
}

# Main script
echo "Starting VM health check..."

check_cpu_usage
check_memory_usage
check_disk_usage
check_network_connectivity
check_logs_for_errors

echo "VM health check completed."
