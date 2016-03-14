#!/bin/bash
echo -e "\033[96m print network interface \033[0m"
sudo lshw -C network
echo -e "\033[96m print  PCI device \033[0m"
lspci
/etc/init.d/network-manager restart
