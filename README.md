# cyberpatriot
scripts for cyberpatriot

to remove a service: `sudo apt-get -y autoremove --purge <package>`

EVERY TIME YOU UPDATE A SCRIPT YOU NEED TO UPDATE THE GISTS AND THE LINKS IN THE GISTS.

#installation

```bash
wget https://gist.github.com/cxdy/5fbee99fcb1f863a770c/raw/b02c9eb1624cd0e89bb3e78f68c5902c47a66a43/run.sh
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
chmod +x CyberPatriot.sh
chmod +x password.sh

# To run:
./CyberPatriot.sh # (CyberPatriot Security Script)
./password.sh # (Password policy script, should be a last resort for points.)
````
