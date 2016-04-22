#!/usr/bin/expect

#./script <user> <pass> <domain> <server:port>

set user [lindex $argv 0]
set pass [lindex $argv 1]
set domain [lindex $argv 2]
set host [lindex $argv 3]

set miss "Authentication failure"

spawn ./sonicwall_netextender_vpnclient -u $user -p $pass -d $domain $host

expect "Do you want to proceed? (Y:Yes, N:No, V:View Certificate)" {send "Y\r\n"}

expect {
	"Authentication failure" {
		send_user "\nMISS\r\n"
	} 
	send_user "\nHIT\r\n"
}

