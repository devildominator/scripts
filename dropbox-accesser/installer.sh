#!/bin/bash
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi
if ! type dropbox-accessor > /dev/null; then
  wget https://raw.github.com/andreafabrizi/Dropbox-Uploader/master/dropbox_uploader.sh
  chmod +x dropbox_uploader.sh
  mv dropbox_uploader.sh /usr/local/bin/dropbox-accessor
  echo "SUCCESSFULLY INSTALLED DROPBOX ACCESSOR -- USE dropbox-accessor"
  exit 1;
else
  read -p "Already Installed. Reinstall ? (y/n)" choice
  case "$choice" in
  y|Y) 
	wget https://raw.github.com/andreafabrizi/Dropbox-Uploader/master/dropbox_uploader.sh
	chmod +x dropbox_uploader.sh
	mv dropbox_uploader.sh /usr/local/bin/dropbox-accessor
	;;
  *)    echo "Skipping."
  esac
fi
