#!/bin/bash
sudo apt update -y
sudo apt install nginx -y
sudo systemctl enable nginx
sudo systemctl start nginx
echo "<h1>Hello from Abbie Coombes - L00196596</h1>" | sudo tee /var/www/html/index.html
