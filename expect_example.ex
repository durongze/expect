#!/usr/bin/expect
set RemoteIp [ lindex $argv 0 ] 
set UserName [ lindex $argv 1 ] 
set PassWord [ lindex $argv 2 ] 
set ThirdLibDir "thirdlib"
set ThirdLibInstall "thirdlib"
spawn ssh -2 "$UserName@$RemoteIp"
expect "assword: " 
send "$PassWord\r"
expect "$ "
send "pushd $ThirdLibDir\r"
expect "$ "
send "chmod 777 $ThirdLibInstall\r"
expect "$ "
#spawn bash "./$ThirdLibInstall\r" =====> ERROR
