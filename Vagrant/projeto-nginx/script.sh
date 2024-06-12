#!/bin/bash

apt update
apt -y install nginx
service nginx restart