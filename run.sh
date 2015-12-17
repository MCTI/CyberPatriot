# exit out if we're not root
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root" 1>&2
    exit 1
fi

if [ -d "/scripts" ] then
    echo "# Ubuntu Security Essentials"
    echo "# Welcome back"
    cd scripts
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
else
    echo "# Ubuntu Security Essentials"
    echo "# Making directories.."
    mkdir scripts
    cd scripts
    echo "# Downloading scripts.."
    wget https://gist.githubusercontent.com/cxdy/47a31af2c57886eee678/raw/3223ebe19ce96b71d0ef78d1b74145ec70441148/CyberPatriot.sh
    wget https://gist.githubusercontent.com/cxdy/cd62d4a93a905d299ef9/raw/f6e26335ca9f4c73661ced0e6ef8ba3f8db858b3/password.sh
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
