#!/bin/bash

# Navigate to the application directory
cd /home/ec2-user/helloworld || { echo "Failed to change directory"; exit 1; }

PID=$(sudo lsof -t -i :80)

if [ -z "$PID" ]; then
  echo "No application is using port 80."
else
  echo "Application using port 80 found with PID: $PID"
  
  echo "Killing process with PID: $PID"
  sudo kill -9 "$PID"
  
  if [ $? -eq 0 ]; then
    echo "Process on port 80 has been killed successfully."
  else
    echo "Failed to kill the process on port 80."
  fi
fi

echo "Flask application killed."

echo "Starting Flask application..."

sudo nohup python3 helloworld.py > flask.log 2>&1 &

# Verify if the Flask app started
if [ $? -eq 0 ]; then
  echo "Flask application started successfully."
else
  echo "Failed to start the Flask application."
  exit 1
fi
