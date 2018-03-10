

clear
echo "Hello, "$USER". Let's begin making your {NSFW} MotD! "
sleep 5



## Make sure only root can run our script
if [ "$(id -u)" != "0" ]; then
   echo "'Please run as root.'" 1>&2
   exit 1
fi


## Update the system as rootm
apt-get update && apt-get install figlet recode


echo " "

## We will need to change the current #MotD file... 
mkdir /etc/update-motd.d/

echo " "


cd /etc/update-motd.d/


echo " "


## Create a new header file for your new #MotD
touch 00-header

echo " "

## Change the file type, so that #bash can run it
chmod +x /etc/update-motd.d/*

echo " "

## Remove your old #MotD
rm /etc/motd

echo " "

##Create a symlink from /var to the /etc file
ln -s /var/run/motd /etc/motd

##*********************************************************************
##*********************************************************************

echo "Now creating your new header file for the MotD."

touch /etc/update-motd.d/00-header

## You will then insert the following in to your 00-header file
echo -e '#!/bin/sh' >> /etc/update-motd.d/00-header
echo -e '' >> /etc/update-motd.d/00-header
echo -e '[ -r /etc/lsb-release ] && . /etc/lsb-release' >> /etc/update-motd.d/00-header
echo -e '' >> /etc/update-motd.d/00-header
echo -e 'if [ -z "$DISTRIB_DESCRIPTION" ] && [ -x /usr/bin/lsb_release ]; then' >> /etc/update-motd.d/00-header
echo -e '        # Fall back to using the very slow lsb_release utility' >> /etc/update-motd.d/00-header
echo -e '        DISTRIB_DESCRIPTION=$(lsb_release -s -d)' >> /etc/update-motd.d/00-header
echo -e 'fi' >> /etc/update-motd.d/00-header
echo -e '' >> /etc/update-motd.d/00-header
echo -e "wget -qO - http://www.asciiartfarts.com/random.cgi | sed -n '/<pre>/,/<\/pre>/p' | sed -n '/<table*/,/<\/table>/p' | sed '1d' | sed '$d' | recode html..ascii" >> /etc/update-motd.d/00-header
echo -e 'printf "\n"' >> /etc/update-motd.d/00-header
echo -e '' >> /etc/update-motd.d/00-header
echo -e 'printf "Welcome to %s (%s).\n" "$DISTRIB_DESCRIPTION" "$(hostname)"' >> /etc/update-motd.d/00-header
echo -e 'printf "\n"" >> 00-header' >> /etc/update-motd.d/00-header

