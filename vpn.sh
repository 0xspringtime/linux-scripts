#!/bin/sh

cd /etc/openvpn
echo "secret surfshark username"
echo "secret surfshark password"
sudo openvpn us-mia.prod.surfshark.com_tcp.ovpn
