#!/bin/bash
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi
if ! type butler > /dev/null; then
  wget https://s3.us-east-1.amazonaws.com/butlercli/1.0.0/linux/butler
  chmod +x butler
  mv butler /usr/local/bin/
  echo "SUCCESSFULLY INSTALLED BUTLER -- USE butler help"
  exit 1;
else
  read -p "Already Installed. Reinstall ? (y/n)" choice
  case "$choice" in
  y|Y) 
  	wget https://s3.us-east-1.amazonaws.com/butlercli/1.0.0/linux/butler
  	chmod +x butler
 	mv butler /usr/local/bin/
	 echo "SUCCESSFULLY INSTALLED BUTLER -- USE butler help"
	;;
  *)    echo "Skipping."
  esac
fi
echo "Installing Helping Scripts"
read -p "Continue (y/n) ?" choice
case "$choice" in
y|Y) 
	echo "Installing : butler-plugin-exporter"
	cp -rf butler-plugin-exporter /usr/local/bin/
	chmod +x /usr/local/bin/butler-plugin-exporter
	echo "Done."
        echo "Installing : butler-plugin-importer"
        cp -rf butler-plugin-importer /usr/local/bin/
        chmod +x /usr/local/bin/butler-plugin-importer
        echo "Done."
        echo "Installing : butler-jobs-exporter"
        cp -rf butler-jobs-exporter /usr/local/bin/
        chmod +x /usr/local/bin/butler-jobs-exporter
        echo "Done."
        echo "Installing : butler-jobs-importer"
        cp -rf butler-jobs-importer /usr/local/bin/
        chmod +x /usr/local/bin/butler-jobs-importer
        echo "Done."
	;;
*)      echo "Done."
	;;
esac
