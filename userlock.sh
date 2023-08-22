#!/usr/bin/bash

ts=$(date+%F)

while :
do
read -p "Enter the username to lock and backup:" user

if [ -z $user ]
then
	echo "${user}, user is not provided"
else
	if id ${user} $> /dev/null
	then
		passwd -l $user
		homeDir=$(grep ^${user}: /etc/passwd | cut -f 6 -d ":")
		echo $homeDir
		if [ -d $homeDir ]
		then 
			echo "${homeDir} exsists..."
			tar -cf ${user}-${ts}.tar $homeDir
			echo "copy of the file is completed"
		fi
		exit 0
	else
		echo "provided user $user not exsists..."
	fi
fi
done
