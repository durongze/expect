#!/bin/bash  

# 要执行的脚本  
script="/home/duyongze/thirdlib/thirdlib.sh"

tarfile="thirdlib.tar.gz"
username="duyongze"
password="123456"
host="192.168.55.132"
port=22

# 匹配提示符  
CMD_PROMPT="\](\$|#)"


expect -c "
    spawn scp $tarfile $username@$host:$tarfile
    expect {  
        *yes/no* { send -- yes\r;exp_continue;}  
        *assword* { send -- $password\r;}  
    }
    expect "100"
    expect eof
    spawn sync
"
echo "\r"


#注意命令之后的参数之间空格要转义  
expect -c "  
    send_user connecting\ to\ $host...\r     
    spawn ssh $username@$host  
    expect {  
        *yes/no* { send -- yes\r;exp_continue;}  
        *assword* { send -- $password\r;}  
    }
    expect -re $CMD_PROMPT  
    send tar\ xf\ $tarfile\r
    expect -re $CMD_PROMPT  
    send -- $script\r  
    expect -re $CMD_PROMPT  
    exit  
"
echo "\r"
