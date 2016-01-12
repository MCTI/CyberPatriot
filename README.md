# cyberpatriot
scripts for cyberpatriot

to remove a service: `sudo apt-get -y autoremove --purge <package>`

EVERY TIME YOU UPDATE A SCRIPT YOU NEED TO UPDATE THE GISTS AND THE LINKS IN THE GISTS.

#installation

```bash
wget https://gist.githubusercontent.com/cxdy/5fbee99fcb1f863a770c/raw/18ebdc98b91e261e3044a25a9a29c6f18f3979f3/run.sh
chmod +x run.sh
# To run:
./run.sh
```

#manual installation

```bash
mkdir scripts
cd scripts
# CyberPatriot Security Script
wget https://gist.githubusercontent.com/cxdy/47a31af2c57886eee678/raw/4af02df3443e527e77a817790316d3867bcc0fad/CyberPatriot.sh
# Password Script
wget https://gist.githubusercontent.com/cxdy/cd62d4a93a905d299ef9/raw/862031198cdb9677eca57ebc1463e95c224f2775/password.sh
# Portscanner Script
wget https://gist.githubusercontent.com/cxdy/bfd4359d1a747fcbe1f1/raw/00ce91d87ef9fb09dbe973a91b3c8f03095bea23/portscan.sh
chmod +x CyberPatriot.sh
chmod +x password.sh
chmod +x portscan.sh
# To run:
./CyberPatriot.sh # (CyberPatriot Security Script)
./password.sh # (Password policy script, should be a last resort for points.)
./portscan.sh # (Scans open and SYN ports)
# To log output:
./CyberPatriot.sh > cyberpatriot.txt 
./password.sh > password.txt 
./portscan.sh > portscan.txt 

````
