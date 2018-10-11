Installation folder
===================

Installation
------------

To install CAN0 and CAN1 on beaglebone :

    cd Install
    chmod +x install.sh
    chmod +x Trilys_CAN_creator
    sudo ./install.sh

Then to create CAN0 at 500kbps :

    ./Trilys_CAN_creator -c 0 -b 500000

For more information about CAN_creator :

    ./Trilys_CAN_creator --help
