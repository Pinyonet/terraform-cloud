#!/bin/bash
    echo "Este es un mensaje" > ~/mensaje.txt

    echo "Este es un mensaje" > /home/ec2-user/mensaje.txt
    chown ec2-user:ec2-user /home/ec2-user/mensaje.txt
    yum update -y
    yum install httpd -y
    systemctl enable httpd
    systemctl start httpd
    