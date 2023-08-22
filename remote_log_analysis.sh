ssh -l ec2-user -i "keyname.pem" ip
scp -i "keyname.pem" web.sh ec2-user@ip:/tmp 
ssh -l ec2-user -i "keyname.pem" ip sudo bash /tmp/web.sh

cat web.sh

awk '$9==404 {print $1}' /var/log/httpd/access_log | sort | uniq | wc -l 




//two run programs through ssh connection

ssh -l user -i key.pem ip "date; hostname" 




