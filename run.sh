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
      read -p "# Do you want to run the main CyberPatriot security script? [Y/n]" answer
      if [[ $answer == [yY] ]]; then
          bash CyberPatriot.sh
      else
          echo "# Okay!"
          read -p "Do you want to run the password policy script? (SHOULD BE RUN AT THE END OF THE COMPETITION IN DESPERATION) [Y/n]" answer
              if [[ $answer == [yY] ]]; then
                  bash password.sh
              else
          echo "Okay! Can always be run again."
              fi
      fi
  else
      echo "# Ubuntu Security Essentials"
      echo "# Making directories.."
      mkdir scripts
      cd scripts
      echo "# Downloading scripts.."
      wget https://gist.github.com/cxdy/47a31af2c57886eee678/raw/e6db3a018acecb60cb05669d1354dd710ff2af01/CyberPatriot.sh
      wget https://gist.github.com/cxdy/cd62d4a93a905d299ef9/raw/f10e6a421dc1ffd16942085cfe87cda3ee94ccae/password.sh
      echo "# Applying necessary permissions to scripts.."
      chmod +x CyberPatriot.sh
      chmod +x password.sh
      echo "# All set!"
      read -p "# Do you want to run the main CyberPatriot security script?" answer
          if [[ $answer == [yY] ]]; then
              bash CyberPatriot.sh
          else
              echo "# Okay!"
              read -p "Do you want to run the password policy script? (SHOULD BE RUN AT THE END OF THE COMPETITION IN DESPERATION" answer
                  if [[ $answer == [yY] ]]; then
                      bash password.sh
                  else
                      echo "Okay! Can always be run again."
                  fi
          fi
  # End of script
  fi

else
    echo "READ THE SCENARIO"
    exit
fi
