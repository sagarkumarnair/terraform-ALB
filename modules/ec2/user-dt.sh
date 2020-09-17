#!/bin/bash
sudo su
yum update
yum -y install httpd
echo "<p>Hello, World</p>" >> /var/www/html/index.html

sudo systemctl enable httpd
sudo systemctl start httpd
