#!/bin/bash

## save path to installer files
## cd "$( cd "$( dirname "$0" )" && pwd )"
cd /Applications/PlexConnect/update/OSX
InstallerPath=${PWD}

## find PlexConnect main path
cd ../..
PlexConnectPath=${PWD}

## go back to InstallerPath
cd update/OSX
DefaultPath=${PWD}

# current user
whoami=${USER}

#!/bin/bash
.
wq
EOF

## copy files to /usr/bin for system wide access
cp backupatvsettings.bash /usr/bin
cp backupatvsettingsbash.bash /usr/bin
cp createcert.bash /usr/bin
cp createcertbash.bash /usr/bin
cp createimovie.bash /usr/bin
cp createimoviebash.bash /usr/bin
cp createwsj.bash /usr/bin
cp createwsjbash.bash /usr/bin
cp install.bash /usr/bin
cp installbash.bash /usr/bin
cp loghigh.bash /usr/bin
cp loghighbash.bash /usr/bin
cp lognormal.bash /usr/bin
cp lognormalbash.bash /usr/bin
cp purgesettings.bash /usr/bin
cp purgesettingsbash.bash /usr/bin
cp restoreatvsettings.bash /usr/bin
cp restoreatvsettingsbash.bash /usr/bin
cp restorecertsbash.bash /usr/bin
cp restorecerts.bash /usr/bin
cp start.bash /usr/bin
cp startbash.bash /usr/bin
cp stop.bash /usr/bin
cp stopbash.bash /usr/bin
cp sudoersfix.bash /usr/bin
cp sudoersfixbash.bash /usr/bin
cp trashbase.bash /usr/bin
cp trashbasebash.bash /usr/bin

## replace __INSTALLERPATH__ in default createimovie.bash
## save directly to the /usr/bin folder
sed -e "s/__INSTALLERPATH__/${InstallerPath//\//\\/}/" "${InstallerPath}/createimovie.bash" > /usr/bin/createimovie.bash

## replace __INSTALLERPATH__ in default createwsj.bash
## save directly to the /usr/bin folder
sed -e "s/__INSTALLERPATH__/${InstallerPath//\//\\/}/" "${InstallerPath}/createwsj.bash" > /usr/bin/createwsj.bash

## replace __INSTALLERPATH__ in default createcert.bash
## save directly to the /usr/bin folder
sed -e "s/__INSTALLERPATH__/${InstallerPath//\//\\/}/" "${InstallerPath}/createcert.bash" > /usr/bin/createcert.bash


## fix permissions
chmod +x /usr/bin/backupatvsettings.bash
chmod +x /usr/bin/backupatvsettingsbash.bash
chmod +x /usr/bin/createcert.bash
chmod +x /usr/bin/createcertbash.bash
chmod +x /usr/bin/createimovie.bash
chmod +x /usr/bin/createimoviebash.bash
chmod +x /usr/bin/createwsj.bash
chmod +x /usr/bin/createwsjbash.bash
chmod +x /usr/bin/install.bash
chmod +x /usr/bin/installbash.bash
chmod +x /usr/bin/loghigh.bash
chmod +x /usr/bin/loghighbash.bash
chmod +x /usr/bin/lognormal.bash
chmod +x /usr/bin/lognormalbash.bash
chmod +x /usr/bin/purgesettings.bash
chmod +x /usr/bin/purgesettingsbash.bash
chmod +x /usr/bin/restoreatvsettings.bash
chmod +x /usr/bin/restoreatvsettingsbash.bash
chmod +x /usr/bin/restorecerts.bash
chmod +x /usr/bin/restorecertsbash.bash
chmod +x /usr/bin/start.bash
chmod +x /usr/bin/startbash.bash
chmod +x /usr/bin/stop.bash
chmod +x /usr/bin/stopbash.bash
chmod +x /usr/bin/sudoersfix.bash
chmod +x /usr/bin/sudoersfixbash.bash
chmod +x /usr/bin/trashbase.bash
chmod +x /usr/bin/trashbasebash.bash


## Themes
## appwewebhome.bash fixes these permissions due to users home dir requirement

## PlexConnect Commands
## appwewebhome.bash fixes appweb.bash
chmod 4755 /usr/bin/backupatvsettings.bash
chmod 4755 /usr/bin/restoreatvsettings.bash
chmod 4755 /usr/bin/loghigh.bash
chmod 4755 /usr/bin/lognormal.bash
chmod 4755 /usr/bin/start.bash
chmod 4755 /usr/bin/stop.bash
## appwewebhome.bash fixes updatewc.bash

## Hijacks
chmod 4755 /usr/bin/restorecerts.bash
chmod 4755 /usr/bin/createcert.bash
chmod 4755 /usr/bin/createimovie.bash
chmod 4755 /usr/bin/createwsj.bash


if [ -s /usr/bin/sudoers.bash ]
then
rm /usr/bin/sudoers.bash
fi


if [ -s /Applications/plexconnect_BACKUP ]
then
chmod -R 777 /Applications/plexconnect_BACKUP
fi
