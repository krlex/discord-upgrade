#!/bin/bash

NAME="Discord"
TEMPFILE="discord.deb"
URL="https://discord.com/api/download?platform=linux&format=deb"
clear;
echo -e "Killing all Processes with name $NAME.";
for KILLPID in `ps ax | grep $NAME | awk ' { print $1;}'`; do 
  kill -9 $KILLPID &> /dev/null
done
echo -e "";
echo -e "Pulling $TEMPFILE from $URL";
wget "$URL" -O $pwd/$TEMPFILE >/dev/null 2>&1
echo -e "";
echo -e "Installing $TEMPFILE";
dpkg -i $pwd/$TEMPFILE >/dev/null
sudo apt install -f -y >/dev/null
echo -e "Installing missing packages"
echo -e "";
echo -e "Removing temp $TEMPFILE";
rm -rf $TEMPFILE >/dev/null
echo -e "";
echo -e "Finished"
echo -e "";
echo -e "You can now launch Discord by typing: discord";
echo -e "";

