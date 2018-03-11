

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



## We will need to change the current #MotD file... 
mkdir /etc/update-motd.d/



cd /etc/update-motd.d/




## Create a new header file for your new #MotD
touch 00-header


## Change the file type, so that #bash can run it
chmod +x /etc/update-motd.d/*


## Remove your old #MotD
rm /etc/motd


##Create a symlink from /var to the /etc file
ln -s /var/run/motd /etc/motd

##*********************************************************************
##*********************************************************************

echo "Now creating your new header file for the MotD."

sleep 2


cd "$(dirname "$(find / -type f -name 00-header | head -1)")" 

cp -Rf ./00-header /etc/update-motd.d/

echo "Looks good!"

sleep 2

bash /etc/update-motd.d/00-header

sleep 2 

bash /etc/update-motd.d/00-header

sleep 2



