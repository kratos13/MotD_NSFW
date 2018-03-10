### This is a {NSFW} Message_of_the_Day script. It pulls from http://www.asciiartfarts.com, and displays a random ASCII art each time you log in. ### 


(+) Install the necessary packages
# sudo apt-get install figlet recode

(+) We will need to change the current #MotD file... 
# mkdir /etc/update-motd.d/

# cd /etc/update-motd.d/

(+) create a new header file for your new #MotD
# touch 00-header

(+) Change the file type, so that #bash can run it
# chmod +x /etc/update-motd.d/*

(+) Remove your old #MotD
# rm /etc/motd

(+) Create a symlink from /var to the /etc file
# ln -s /var/run/motd /etc/motd

*********************************************************************
*********************************************************************

(+) You will then insert the following in to your 00-header file
#!/bin/sh
 
[ -r /etc/lsb-release ] && . /etc/lsb-release
 
if [ -z "$DISTRIB_DESCRIPTION" ] && [ -x /usr/bin/lsb_release ]; then
        # Fall back to using the very slow lsb_release utility
        DISTRIB_DESCRIPTION=$(lsb_release -s -d)
fi
 
wget -qO - http://www.asciiartfarts.com/random.cgi | sed -n '/<pre>/,/<\/pre>/p' | sed -n '/<table*/,/<\/table>/p' | sed '1d' | sed '$d' | recode html..ascii
printf "\n"
 
printf "Welcome to %s (%s).\n" "$DISTRIB_DESCRIPTION" "$(hostname)"
printf "\n"
