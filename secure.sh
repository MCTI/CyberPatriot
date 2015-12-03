#!/bin/bash
function main {
    #variable assignment
    now="$(date +'%d/%m/%Y %r')"
    #intro
    echo "securing system ( $now )"
    echo "run as 'sudo sh secure.sh 2>&1 | tee output.log' to output the console output to a log file."
    echo "refer to /root/.logfiles/ folder for program logs"
    #preperation
    echo "Initializing log files.."
    mkdir -v $HOME/.log-files
    cd $HOME/.log-files
    # Disable root
    echo "Making sure root is disabled.."

    #updates/installs
    echo "Updating kernel to v4.3.."
    cd /tmp/
    wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.3-wily/linux-headers-4.3.0-040300-generic_4.3.0-040300.201511020949_amd64.deb
    wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.3-wily/linux-headers-4.3.0-040300_4.3.0-040300.201511020949_all.deb
    wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.3-wily/linux-image-4.3.0-040300-generic_4.3.0-040300.201511020949_amd64.deb
    dpkg -i *.deb
    echo "Kernel updated! You WILL need to reboot."
    cd /
    echo "Installing firefox, hardinfo, chkrootkit, iptables, portsentry, lynis & ufw.."
    apt-get -V -y install firefox, hardinfo, chkrootkit, iptables, portsentry, lynis, ufw
    apt-get update
    apt-get upgrade
    #information gathering
    echo "Logging info from some tools we installed!"
    hardinfo -r -f html > /root/.logfiles/hardinfo-html.html
    chkrootkit > /root/.logfiles/chkrootkit.log
    checkps > /root/.logfiles/checkps.log
    lynis -c > /root/.logfiles/lynis.log
    #account security
    echo "Setting password expiry.."
    #network security
    echo "Firewall configuration.."
    iptables -A INPUT -p tcp -s 0/0 -d 0/0 --dport 23 -j DROP         
    chage -M 60 -W 7#Block Telnet
    echo "Blocked Telnet!"
    iptables -A INPUT -p tcp -s 0/0 -d 0/0 --dport 2049 -j DROP       #Block NFS
    echo "Blocked NFS!"
    iptables -A INPUT -p udp -s 0/0 -d 0/0 --dport 2049 -j DROP       #Block NFS
    echo "Blocked NFS!"
    iptables -A INPUT -p tcp -s 0/0 -d 0/0 --dport 6000:6009 -j DROP  #Block X-Windows
    echo "Blocked X-Windows!"
    iptables -A INPUT -p tcp -s 0/0 -d 0/0 --dport 7100 -j DROP       #Block X-Windows font server
    echo "Blocked X-Windows font server!"
    iptables -A INPUT -p tcp -s 0/0 -d 0/0 --dport 515 -j DROP        #Block printer port
    echo "Blocked printer port!"
    iptables -A INPUT -p udp -s 0/0 -d 0/0 --dport 515 -j DROP        #Block printer port
    echo "Blocked printer port!"
    iptables -A INPUT -p tcp -s 0/0 -d 0/0 --dport 111 -j DROP        #Block Sun rpc/NFS
    echo "Blocked Sun RPC/NFS!"
    iptables -A INPUT -p udp -s 0/0 -d 0/0 --dport 111 -j DROP        #Block Sun rpc/NFS
    echo "Blocked Sun RPC/NFS!"
    iptables -A INPUT -p all -s localhost  -i eth0 -j DROP            #Deny outside packets from internet which claim to be from your loopback interface.
    echo "Blocked fake loopback packets!"
    #media file deletion
    echo "Deleting media files.."
    find / -name '*.mp3' -type f -delete
    find / -name '*.mov' -type f -delete
    find / -name '*.mp4' -type f -delete
    find / -name '*.avi' -type f -delete
    find / -name '*.mpg' -type f -delete
    find / -name '*.mpeg' -type f -delete
    find / -name '*.flac' -type f -delete
    find / -name '*.m4a' -type f -delete
    find / -name '*.flv' -type f -delete
    find / -name '*.ogg' -type f -delete
    find /home -name '*.gif' -type f -delete
    find /home -name '*.png' -type f -delete
    find /home -name '*.jpg' -type f -delete
    find /home -name '*.jpeg' -type f -delete
    echo "Disabling guest account.."
    sh -c 'printf "[SeatDefaults]\nallow-guest=false\n" >/usr/share/lightdm/lightdm.conf.d/50-no-guest.conf'
}

function check {
    # Checking if you read the scenario
    echo "Make sure you READ THE SCENARIO"
    echo "R E A D  T H E  S C E N A R I O"
    echo -n "Did you read scenario? (y/n) "
    old_stty_cfg=$(stty -g)
    stty raw -echo
    answer=$( while ! head -c 1 | grep -i '[ny]' ;do true ;done )
    stty $old_stty_cfg
    if echo "$answer" | grep -iq "^y" ;then
        main
    else
        echo "READ THE SCENARIO"
        exit
    fi
}

if [ "$(id -u)" != "0" ]; then
    echo "Elevated permissions required. Run again as sudo."
    exit
else
    check
fi
