#TEST#1 This is a {NSFW} Message_of_the_Day script. It pulls from http://www.asciiartfarts.com, and displays a random ASCII art each time you log in. ### 


*(+) Install the necessary packages*
# sudo apt-get install figlet recode


*(+) We will need to change the current #MotD file...* 
# mkdir /etc/update-motd.d/

# cd /etc/update-motd.d/


*(+) create a new header file for your new #MotD*
# touch 00-header


*(+) Change the file type, so that #bash can run it*
# chmod +x /etc/update-motd.d/*


*(+) Remove your old #MotD*
# rm /etc/motd


*(+) Create a symlink from /var to the /etc file*
# ln -s /var/run/motd /etc/motd

*********************************************************************
*********************************************************************

*(+) You will then insert the 00-header file to /etc/update-motd.d/*



>  o                               
> |__|                               
>(_O_o)                              
> _||_  -- DO ME SIX WAYS FROM SUNDAY
>//  |\                              
>\'--'/                              
> || |                               
> '-'-'                              

Welcome to Raspbian GNU/Linux 8.0 (jessie) (cronus).

