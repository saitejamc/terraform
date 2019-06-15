#!/bin/bash

yum install -y httpd
service start httpd
echo "hello world" > /var/www/html/index.html
