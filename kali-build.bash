#!/bin/bash
# run script as root


echo "************************************************************************************"
echo "**********************Updating System Fully*****************************************"
echo "************************************************************************************"
# update system
apt-get update
apt-get dist-upgrade


echo "************************************************************************************"
echo "**********************Setting Up Metasploit*****************************************"
echo "************************************************************************************"
# setup Metasploit
service postgresql start
service Metasploit start

# enable metasploit logging
echo "spool/root/msf_console.log" > /root/.msf4/msfconsole.rc


echo "************************************************************************************"
echo "**********************Installing Discover Scripts***********************************"
echo "************************************************************************************"
# install Discover Scripts
cd /opt
git clone https://github.com/leebaird/discover.git
cd discover/
./setup.sh


echo "************************************************************************************"
echo "**********************Installing SMBExec*****************************************"
echo "************************************************************************************"
# install smbexec
cd opt/
git clone https://github.com/brav0hax/smbexec.git
cd smbexec
./install.sh


echo "************************************************************************************"
echo "**********************Installing Veil***********************************************"
echo "************************************************************************************"
# install Veil
cd /opt/
git clone https://github.com/veil-evasion/Veil.git
cd ./Veil/setup
./setup.sh


echo "************************************************************************************"
echo "**********************Installing Windows Credential Editor**************************"
echo "************************************************************************************"
# install Windows Credential Editor
cd ~/Desktop
wget http://www.ampliasecurity.com/research/wce_v1_41beta_universal.zip
unzip -d ./wce wce_v1_41beta_universal.zip


echo "************************************************************************************"
echo "**********************Installing MimiKatz*****************************************"
echo "************************************************************************************"
# install Mimikatz
cd ~/Desktop
wget http://blog.gentilkiwi.com/downloads/mimikatz_trunk.zip
unzip -d ./mimikatz mimikatz_trunk.zip


echo "************************************************************************************"
echo "**********************Downloading Useful Wordlists**********************************"
echo "************************************************************************************"
# save custom password lists
cd ~/Desktop
mkdir ./password_list && cd ./password_list
gzip -d crackstation-human-only.txt.gz
wget https://downloads.skullsecurity.org/passwords/rockyou.txt.bz2
bzip2 -d rockyou.txt.bzip2
cd ~/Desktop


echo "************************************************************************************"
echo "**********************Installing PeepingTom*****************************************"
echo "************************************************************************************"
# install peepingtom for screenshots of webpages
cd /opt/
git clone https://bitbucket.org/LaNMaSteR53/peepingtom.git
cd ./peepingtom/
wget https://gist.github.com/nopslider/5984316/raw/423b02c53d225fe8dfb4e2df9a20bc800cc78e2c/gnmap.ps -A
wget https://phantomjs.googlecode.com/files/phantomjs-1.9.2-linux-i686.tar.bz2
tar xvjf phantomjs-1.9.2-linux-i686.tar.bz2
cp ./phantomjs-1.9.2-linux-i686/bin/phantomjs .


echo "************************************************************************************"
echo "**********************Installing NMAP Scripts***************************************"
echo "************************************************************************************"
# install NMAp script
cd /usr/share/nmap/scripts
wget https://raw.github.com/hdm/scan-tools/master/nse/banner-plus.nse


echo "************************************************************************************"
echo "**********************Installing PowerSploit****************************************"
echo "************************************************************************************"
# install powersploit
cd /opt/
git clone https://github.com/mattifestation/PowerSploit.git
cd PowerSploit
wget https://raw.github.com/obscuresec/random/master/StartListener.py
wget https://raw.github.com/darkoperator/powershell_scripts/master/ps_encoder.py


echo "************************************************************************************"
echo "**********************Installing Responder******************************************"
echo "************************************************************************************"
# install Responder
cd /opt/
git clone https://github.com/SpiderLabs/Responder.git


echo "************************************************************************************"
echo "**********************Installing SET - Social Engineering Toolkit*******************"
echo "************************************************************************************"
# install Social Engineering Toolkit
cd /opt/
git clone https://github.com/trustedsec/social-engineering-toolkit/ set/
cd set
./setup.py install 


echo "************************************************************************************"
echo "**********************Installing BypassUAC******************************************"
echo "************************************************************************************"
# install bypassuac
cd /opt/
wget http://www.secmaniac.com/files/bypassuac.zip
unzip bypassuac.zip
cp bypassuac/bypassuac.rb /opt/metasploit/apps/pro/msf3/scipts/meterpreter/
mv bypassuac/uac//opt/metasploit/apps/pro/msf3/data/exploits/


echo "************************************************************************************"
echo "**********************Installing BeEf XSS Framework*********************************"
echo "************************************************************************************"
# install BeEf
apt-get install beef-xss


echo "************************************************************************************"
echo "**********************Installing Seclists*******************************************"
echo "************************************************************************************"
# install SecLists
cd /opt/
git clone https://github.com/danialmiessler/SecLists.git


echo "************************************************************************************"
echo "**********************Displaying Links to Firefox Addons to install*****************"
echo "************************************************************************************"
# now echo out the firefox addons that need installed with the links
echo "And finally, just install the required Firefox Addons"
echo "Install Web Developer Tools at https://addons.mozilla.org/en-US/firefox/addon/web-developer/"
echo "Install Tamper Data at https://addons.mozilla.org/en-US/firefox/addon/tamper-data/"
echo "Install Foxy Proxy at https://addons.mozilla.org/en-US/firefox/addon/foxyproxy-standard/"
echo "Install User Agent Switcher at https://addons.mozilla.org/en-US/firefox/addon/user-agent-switcher/"