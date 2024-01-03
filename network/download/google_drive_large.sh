### 
 # @Author: LOTEAT
 # @Date: 2024-01-03 19:39:15
### 

if ! [ $# -eq 2 ] ; then
    echo "usage: filename and the share link of file in google drive"
    exit -1
fi

filename=$1
url=$2 
fileid=$(echo $url | sed 's/.*\/d\/\([^\/]*\)\/.*/\1/')
wget --load-cookies /tmp/cookies.txt "https://drive.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://drive.google.com/uc?export=download&id=${fileid}' -O- | sed -rn 's/.confirm=([0-9A-Za-z_]+)./\1\n/p')&id=${fileid}" -O ${filename} && rm -rf /tmp/cookies.txt

