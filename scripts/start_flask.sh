#!/bin/bash

cd /home/ec2-user/helloworld

PID=$(sudo lsof -t -i :80)

if [ -z "$PID" ]; then
  echo "No application is using port 80."
  exit 0
else
  echo "Application using port 80 found with PID: $PID"
  
  # Kill the process
  echo "Killing process with PID: $PID"
  sudo kill -9 $PID
  
  # Verify if the process was successfully killed
  if [ $? -eq 0 ]; then
    echo "Process on port 80 has been killed successfully."
  else
    echo "Failed to kill the process on port 80."
    exit 1
  fi
fi

echo "Flask application killed."

sudo nohup python3 helloworld.py &

echo "Flask application started."