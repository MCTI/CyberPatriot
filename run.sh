# exit out if we're not root
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root" 1>&2
    exit 1
fi

# Checking if you read the scenario
echo "# Ubuntu Main Security Script"
echo "# Make sure you READ THE SCENARIO"
echo "# R E A D  T H E  S C E N A R I O"
echo -n "# Did you read scenario? (y/n) "
old_stty_cfg=$(stty -g)
stty raw -echo
answer=$( while ! head -c 1 | grep -i '[ny]' ;do true ;done )
stty $old_stty_cfg
if echo "$answer" | grep -iq "^y" ;then
  if [ -d "/scripts" ]; then
      echo "# Ubuntu Security Essentials"
      echo "# Welcome back"
      cd scripts
      echo "# Choose a script.."
      echo ""
      echo ""
      echo "# 1. CyberPatriot.SH (Main script, provides security essentials and may give some points)"
      echo "# 2. Password.SH (Password policy script, run near the end of the competition for extra points)"
      echo "# 3. Portscan.SH (Scans the open ports and performs a SYN scan)"
      echo "# 4. Exit (Exits Run.SH)"
      echo ""
      echo "# Warning: Only respond with 1, 2, 3 or 4. Responding with anything other than 1, 2, 3 or 4 will cause an error"
      echo "# Script output will automatically be logged to text files that correspond with the scripts."
      read INPUT

      if [ $INPUT -eq 1 ]; then
        echo "# Running CyberPatriot.SH.."
        echo "# Don't leave your system, user input is required."
        sleep 3
        bash CyberPatriot.sh > cyberpatriot.txt

      elif [ $INPUT -eq 2 ]; then
        echo "# Are you sure you want to run password.sh?"
        echo "# Reminder: This should only be run towards the end of the competition due to possibility of being locked out of your admin account"
        read -p "# Respond with Y/N" password
        if [[ $password == [yY] ]]; then
          sleep 3
          bash password.sh > password.txt
          else
              echo "Good call."
              echo "Exiting Run.SH now.."
              echo "Re-run if necessary."
              exit
          fi

      elif [ $INPUT -eq 3 ]; then
        echo "# Running Portscan.SH"
        sleep 3
        bash portscan.sh > portscan.txt

      elif [ $INPUT -eq 4 ]; then
        echo "# Exiting script.."
        echo "# Re-run as necessary"
        exit
      else
        echo "# You suck at following directions."
        exit
      fi
  else
      echo "# Ubuntu Security Essentials"
      echo "# Making directories.."
      mkdir scripts
      cd scripts
      echo "# Downloading scripts.."
      wget https://gist.github.com/cxdy/47a31af2c57886eee678/raw/e6db3a018acecb60cb05669d1354dd710ff2af01/CyberPatriot.sh
      wget https://gist.github.com/cxdy/cd62d4a93a905d299ef9/raw/f10e6a421dc1ffd16942085cfe87cda3ee94ccae/password.sh
      wget https://gist.githubusercontent.com/cxdy/bfd4359d1a747fcbe1f1/raw/00ce91d87ef9fb09dbe973a91b3c8f03095bea23/portscan.sh
      echo "# Applying necessary permissions to scripts.."
      chmod +x CyberPatriot.sh
      chmod +x password.sh
      chmod +x portscan.sh
      echo "# All set!"
      echo ""
      echo ""
      echo "# RUNNING MAIN SCRIPT #"
      echo ""
      echo ""
      echo "# Choose a script.."
      echo ""
      echo ""
      echo "# 1. CyberPatriot.SH (Main script, provides security essentials and may give some points)"
      echo "# 2. Password.SH (Password policy script, run near the end of the competition for extra points)"
      echo "# 3. Portscan.SH (Scans the open ports and performs a SYN scan)"
      echo "# 4. Exit (Exits Run.SH)"
      echo ""
      echo "# Warning: Only respond with 1, 2, 3 or 4. Responding with anything other than 1, 2, 3 or 4 will cause an error"
      echo "# Script output will automatically be logged to text files that correspond with the scripts."
      read INPUT

      if [ $INPUT -eq 1 ]; then
        echo "# Running CyberPatriot.SH.."
        echo "# Don't leave your system, user input is required."
        sleep 3
        bash CyberPatriot.sh > cyberpatriot.txt

      elif [ $INPUT -eq 2 ]; then
        echo "# Are you sure you want to run password.sh?"
        echo "# Reminder: This should only be run towards the end of the competition due to possibility of being locked out of your admin account"
        read -p "# Respond with Y/N" password
        if [[ $password == [yY] ]]; then
          sleep 3
          bash password.sh > password.txt
          else
              echo "Good call."
              echo "Exiting Run.SH now.."
              echo "Re-run if necessary."
              exit
          fi

      elif [ $INPUT -eq 3 ]; then
        echo "# Running Portscan.SH"
        sleep 3
        bash portscan.sh > portscan.txt

      elif [ $INPUT -eq 4 ]; then
        echo "# Exiting script.."
        echo "# Re-run as necessary"
        exit
      else
        echo "# You suck at following directions."
        exit
      fi
  # End of script
  fi

else
    echo "READ THE SCENARIO"
    exit
fi
