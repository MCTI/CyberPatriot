# cyberpatriot
scripts for cyberpatriot


to remove a service: `sudo apt-get -y autoremove --purge <package>`


#installation

```shell
wget https://gist.githubusercontent.com/cxdy/5fbee99fcb1f863a770c/raw/eaf7211b2c00dec2883612deac3a675af24b83ea/run.sh
chmod +x run.sh
# To run:
./run.sh
```

#manual installation

```shell
mkdir scripts
cd scripts
# CyberPatriot Security Script
wget https://gist.githubusercontent.com/cxdy/47a31af2c57886eee678/raw/e6db3a018acecb60cb05669d1354dd710ff2af01/CyberPatriot.sh
# Password Script
wget https://gist.githubusercontent.com/cxdy/cd62d4a93a905d299ef9/raw/f10e6a421dc1ffd16942085cfe87cda3ee94ccae/password.sh
chmod +x CyberPatriot.sh
chmod +x password.sh

# To run:
./CyberPatriot.sh # (CyberPatriot Security Script)
./password.sh # (Password policy script, should be a last resort for points.)
````
