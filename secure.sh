# updates
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install sudo -y

# kernel upgrade
mkdir kernel
cd kernel
wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.3-wily/linux-headers-4.3.0-040300-generic_4.3.0-040300.201511020949_amd64.deb -y
wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.3-wily/linux-image-4.3.0-040300-generic_4.3.0-040300.201511020949_amd64.deb -y
wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.3-wily/linux-headers-4.3.0-040300_4.3.0-040300.201511020949_all.deb -y
sudo dpkg -i *.deb 

# firewall
sudo ufw enable

# remove guest account
sudo sh -c 'printf "[SeatDefaults]\nallow-guest=false\n" >/usr/share/lightdm/lightdm.conf.d/50-no-guest.conf'

# password policy
