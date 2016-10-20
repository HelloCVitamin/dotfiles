# A lancer comme root
if ! [ $(id -u) = 0 ]; then
   echo "Use with sudo -E"
   exit 1
fi

ln -sv $PWD/ativ9_set_screens.sh /usr/local/bin/ativ9_set_screens.sh
ln -sv $PWD/ezativmulti /usr/local/bin/ezativmulti
ln -sv $PWD/ezativsingle /usr/local/bin/ezativsingle
