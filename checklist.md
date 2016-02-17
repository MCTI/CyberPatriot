## CyberPatriot VIII - Ubuntu 14.04 (Round 4) - Team 08-1021
#### Please read the scenario before continuing

### Limit 'su' access to sudoers only

    dpkg-statoverride --update --add root sudo 4750 /bin/su

### Improve IP security
Open the sysctl config

    sudo nano /etc/sysctl.conf
   
Add the following lines to the file
```
# Ignore ICMP broadcast requests
net.ipv4.icmp_echo_ignore_broadcasts = 1

# Disable source packet routing
net.ipv4.conf.all.accept_source_route = 0
net.ipv6.conf.all.accept_source_route = 0 
net.ipv4.conf.default.accept_source_route = 0
net.ipv6.conf.default.accept_source_route = 0

# Ignore send redirects
net.ipv4.conf.all.send_redirects = 0
net.ipv4.conf.default.send_redirects = 0

# Block SYN attacks
net.ipv4.tcp_max_syn_backlog = 2048
net.ipv4.tcp_synack_retries = 2
net.ipv4.tcp_syn_retries = 5

# Log Martians
net.ipv4.conf.all.log_martians = 1
net.ipv4.icmp_ignore_bogus_error_responses = 1

# Ignore ICMP redirects
net.ipv4.conf.all.accept_redirects = 0
net.ipv6.conf.all.accept_redirects = 0
net.ipv4.conf.default.accept_redirects = 0 
net.ipv6.conf.default.accept_redirects = 0

# Ignore Directed pings
net.ipv4.icmp_echo_ignore_all = 1
```
Restart the sysctl daemon

    sudo sysctl -p

### Prevent IP spoofing
Open the host file

    sudo nano /etc/host.conf
Add the following lines
```
order bind,hosts
nospoof on
```
### Harden PHP (if installed)
Open the PHP.ini file

    sudo nano /etc/php5/apache2/php.ini
    
Add the following lines
```
disable_functions = exec,system,shell_exec,passthru
register_globals = Off
expose_php = Off
```

### Harden Apache (if installed)
```
External resources:

http://www.thefanclub.co.za/how-to/how-install-apache2-modsecurity-and-modevasive-ubuntu-1204-lts-server
```

### Install Fail2Ban

Install Fail2Ban

    sudo apt-get install fail2ban
    
Configure Fail2Ban
```
sudo nano /etc/fail2ban/jail.conf

Select the services you want to monitor
```

### Check for rootkits - RKHunter and CHKRootKit
Install RKHunter and CHKRootKit
    
    sudo apt-get install rkhunter chkrootkit

To run CHKRootKit
