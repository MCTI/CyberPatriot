# exit out if we're not root
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root" 1>&2
    exit 1
fi

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
