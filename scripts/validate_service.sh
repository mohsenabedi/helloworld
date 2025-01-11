#!/bin/bash

for i in {1..10}; do
  curl -f http://localhost:80 && exit 0
  echo "Waiting for Flask app..."
  sleep 1
done

echo "Flask app failed to start."
exit 1