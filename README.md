# canbus\_on\_beaglebone
Simple bash script to enable CAN0 and CAN1 on BeagleBone.

## Before starting

### Debian installation

The installation works on special debian images, available on [https://rcn-ee.com/rootfs/bb.org/testing/2017-02-19/iot/](https://rcn-ee.com/rootfs/bb.org/testing/2017-02-19/iot/)  
Download :  
    bone-debian-8.7-iot-armhf-2017-02-19-4gb.img.xz

Dump the image to any µSD card, then edit the file /boot/uEnv.txt to remove the comment of the last line. In that case, it will automatically install this into your BeagleBone.  

### Get internet on your BeagleBone

#### on BeagleBone
    sudo route add default gw 192.168.7.1
    sudo su
    echo "nameserver 8.8.8.8" >> /etc/resolv.conf

#### On Windows : 
allow connexion sharing + re set IP

#### or on Linux
    sudo su
    iptables --table nat --append POSTROUTING --out-interface wlan0 -j MASQUERADE ////// iptables --table nat --append POSTROUTING --out-interface wlp2s0 -j MASQUERADE
    iptables --append FORWARD --in-interface ethx -j ACCEPT /////// iptables --append FORWARD --in-interface enx985dad7f6353 -j ACCEPT
    echo 1 > /proc/sys/net/ipv4/ip_forward

### Installation

ssh on your BeagleBone :  

    ssh debian@192.168.7.2

Password : *temppwd*

Clone the repo  
[https://github.com/RobertCNelson/dtb-rebuilder/tree/4.4-ti](https://github.com/RobertCNelson/dtb-rebuilder/tree/4.4-ti)  

    git clone https://github.com/RobertCNelson/dtb-rebuilder.git
    cd dtb-rebuilder/
    git checkout 4.4-ti

Copy the repo to your BeagleBone, then cd in the repo :

    ./dtc-overlay.sh
    sudo make install
    chmod +x dtc-overlay.sh
    

## Thanks 
[RobertCNelson for dtb-rebuilder to enable both CAN at the same time.](https://github.com/RobertCNelson)  
