#!/bin/bash

cd /home/ec2-user/helloworld

pkill -f "python3 /home/ec2-user/helloworld/helloworld.py"

echo "Flask application killed."

python3 helloworld.py 

echo "Flask application started."