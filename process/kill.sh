
###
 # @Author: LOTEAT
 # @Date: 2024-01-05 15:50:25
### 
if ! [ $# -eq 1 ] ; then
    echo "usage: process name"
    exit -1
fi
ps aux | grep $1 | awk '{print $2}' | xargs kill -9 
