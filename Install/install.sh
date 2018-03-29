#! /bin/bash
# install.sh : install all files to use CAN0 or CAN1

if [ "$EUID" -ne 0 ]; then
	echo -e "You need to execute \033[33msudo\033[39m $0"
	exit 1
fi

echo "This install work on \033[33mBeagleBone (tested on green)\033[39m"
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo "The directory to install is $DIR"
echo -en "Do you want to install CAN0 and CAN1?(Y/n)"
read resp_all
if [ "$resp_all" = n ] || [ "$resp_all" = N  ]; then
	echo "End of $0. Nothing installed."
	exit 1
fi

echo -e "\033[31m\033[47mInstall CAN0...\033[39m\033[49m"
#    cd /home/debian/CAN
cd $DIR
dtc -O dtb -o BB-DCAN0-00A0.dtbo -b 0 -@ BB-DCAN0-00A0.dts
sudo mv BB-DCAN0-00A0.dtbo /lib/firmware
dtc -O dtb -o BB-DCAN1-00A0.dtbo -b 0 -@ BB-DCAN1-00A0.dts
sudo mv BB-DCAN1-00A0.dtbo /lib/firmware
echo "CAN0 and CAN1 installed."
sudo cp Trilys_CAN_creator /usr/local/bin/
echo "Trilys_CAN_creator installed."

echo "To launch them, launch Trilys_CAN_creator."

exit 0
