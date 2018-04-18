#!/bin/bash
RemoteIp=$1
UserName=$2
PassWord=$3 
/usr/bin/expect <<END
spawn ssh -2 "$UserName@$RemoteIp"
expect "assword: "
send "$PassWord\r"
expect "$ "
send "echo $RemoteIp,$UserName,$PassWord"
interact 
END
