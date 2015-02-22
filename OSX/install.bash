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

## Generate wcios.bash based on OSX IP Address for webconnect.cgi
ifconfig | grep "inet " | grep -v 127.0.0.1 | cut -d\  -f2 > wcios.bash
ed -s wcios.bash << EOF
1
a
:1234\/cgi-bin\/ios.cgi/g' webconnect.cgi
.
1,2j
wq
EOF
ed -s wcios.bash << EOF
i
sed -i '' 's/__IOS__/http:\/\/
.
1,2j
wq
EOF
ed -s wcios.bash << EOF
i
cd /Library/WebServer/CGI-Executables
.
wq
EOF

## Generate wclist.bash based on OSX IP Address for webconnect.cgi
ifconfig | grep "inet " | grep -v 127.0.0.1 | cut -d\  -f2 > wclist.bash
ed -s wclist.bash << EOF
1
a
:1234\/cgi-bin\/list.cgi/g' webconnect.cgi
.
1,2j
wq
EOF
ed -s wclist.bash << EOF
i
sed -i '' 's/__LIST__/http:\/\/
.
1,2j
wq
EOF
ed -s wclist.bash << EOF
i
cd /Library/WebServer/CGI-Executables
.
wq
EOF

## Generate wcopenplex.bash based on OSX IP Address for webconnect.cgi
ifconfig | grep "inet " | grep -v 127.0.0.1 | cut -d\  -f2 > wcopenplex.bash
ed -s wcopenplex.bash << EOF
1
a
:1234\/cgi-bin\/openplex.cgi/g' webconnect.cgi
.
1,2j
wq
EOF
ed -s wcopenplex.bash << EOF
i
sed -i '' 's/__OPENPLEX__/http:\/\/
.
1,2j
wq
EOF
ed -s wcopenplex.bash << EOF
i
cd /Library/WebServer/CGI-Executables
.
wq
EOF

## Generate wcdefault.bash based on OSX IP Address for webconnect.cgi
ifconfig | grep "inet " | grep -v 127.0.0.1 | cut -d\  -f2 > wcdefault.bash
ed -s wcdefault.bash << EOF
1
a
:1234\/cgi-bin\/bash.cgi/g' webconnect.cgi
.
1,2j
wq
EOF
ed -s wcdefault.bash << EOF
i
sed -i '' 's/__DEFAULT__/http:\/\/
.
1,2j
wq
EOF
ed -s wcdefault.bash << EOF
i
cd /Library/WebServer/CGI-Executables
.
wq
EOF

## Generate wcinstaller.bash based on OSX IP Address for webconnect.cgi
ifconfig | grep "inet " | grep -v 127.0.0.1 | cut -d\  -f2 > wcinstaller.bash
ed -s wcinstaller.bash << EOF
1
a
:1234\/cgi-bin\/installer.cgi/g' webconnect.cgi
.
1,2j
wq
EOF
ed -s wcinstaller.bash << EOF
i
sed -i '' 's/__INSTALLER__/http:\/\/
.
1,2j
wq
EOF
ed -s wcinstaller.bash << EOF
i
cd /Library/WebServer/CGI-Executables
.
wq
EOF

## Generate plexweb.bash based on OSX IP Address for bash.cgi
ifconfig | grep "inet " | grep -v 127.0.0.1 | cut -d\  -f2 > plexweb.bash
ed -s plexweb.bash << EOF
1
a
:32400\/web\/index.html#!\/dashboard/g' bash.cgi
.
1,2j
wq
EOF
ed -s plexweb.bash << EOF
i
sed -i '' 's/__PLEXWEB__/http:\/\/
.
1,2j
wq
EOF
ed -s plexweb.bash << EOF
i
cd /Library/WebServer/CGI-Executables
.
wq
EOF

## Generate plexwebios.bash based on OSX IP Address for ios.cgi
ifconfig | grep "inet " | grep -v 127.0.0.1 | cut -d\  -f2 > plexwebios.bash
ed -s plexwebios.bash << EOF
1
a
:32400\/web\/index.html#!\/dashboard/g' ios.cgi
.
1,2j
wq
EOF
ed -s plexwebios.bash << EOF
i
sed -i '' 's/__PLEXWEB__/http:\/\/
.
1,2j
wq
EOF
ed -s plexwebios.bash << EOF
i
cd /Library/WebServer/CGI-Executables
.
wq
EOF

## Generate plexweblist.bash based on OSX IP Address for list.cgi
ifconfig | grep "inet " | grep -v 127.0.0.1 | cut -d\  -f2 > plexweblist.bash
ed -s plexweblist.bash << EOF
1
a
:32400\/web\/index.html#!\/dashboard/g' list.cgi
.
1,2j
wq
EOF
ed -s plexweblist.bash << EOF
i
sed -i '' 's/__PLEXWEB__/http:\/\/
.
1,2j
wq
EOF
ed -s plexweblist.bash << EOF
i
cd /Library/WebServer/CGI-Executables
.
wq
EOF

## Generate PlexWebWan.bash based on Wan IP Address for bash.cgi
curl icanhazip.com > plexwebwan.bash
ed -s plexwebwan.bash << EOF
1
a
:32400\/web\/index.html#!\/dashboard/g' bash.cgi
.
1,2j
wq
EOF
ed -s plexwebwan.bash << EOF
i
sed -i '' 's/__PLEXWEBWAN__/http:\/\/
.
1,2j
wq
EOF
ed -s plexwebwan.bash << EOF
i
cd /Library/WebServer/CGI-Executables
.
wq
EOF

## Generate plexwebioswan.bash based on Wan IP Address for ios.cgi
curl icanhazip.com > plexwebioswan.bash
ed -s plexwebioswan.bash << EOF
1
a
:32400\/web\/index.html#!\/dashboard/g' ios.cgi
.
1,2j
wq
EOF
ed -s plexwebioswan.bash << EOF
i
sed -i '' 's/__PLEXWEBWAN__/http:\/\/
.
1,2j
wq
EOF
ed -s plexwebioswan.bash << EOF
i
cd /Library/WebServer/CGI-Executables
.
wq
EOF

## Generate plexweblistwan.bash based on Wan IP Address for list.cgi
curl icanhazip.com > plexweblistwan.bash
ed -s plexweblistwan.bash << EOF
1
a
:32400\/web\/index.html#!\/dashboard/g' list.cgi
.
1,2j
wq
EOF
ed -s plexweblistwan.bash << EOF
i
sed -i '' 's/__PLEXWEBWAN__/http:\/\/
.
1,2j
wq
EOF
ed -s plexweblistwan.bash << EOF
i
cd /Library/WebServer/CGI-Executables
.
wq
EOF

## Generate xml.bash based on OSX IP Address for all .xml files
ifconfig | grep "inet " | grep -v 127.0.0.1 | cut -d\  -f2 > xml.bash
ed -s xml.bash << EOF
1
a
/g' *xml
.
1,2j
wq
EOF
ed -s xml.bash << EOF
i
sed -i '' 's/__LOCALIP__/
.
1,2j
wq
EOF
ed -s xml.bash << EOF
i
#!/bin/bash
.
wq
EOF

## WebConnect Requirements
cp bash.cgi /Library/WebServer/CGI-Executables/
cp ios.cgi /Library/WebServer/CGI-Executables/
cp list.cgi /Library/WebServer/CGI-Executables/
cp openplex.cgi /Library/WebServer/CGI-Executables/
cp installer.cgi /Library/WebServer/CGI-Executables/
cp webconnect.cgi /Library/WebServer/CGI-Executables/
chmod +x /Library/WebServer/CGI-Executables/bash.cgi
chmod +x /Library/WebServer/CGI-Executables/ios.cgi
chmod +x /Library/WebServer/CGI-Executables/list.cgi
chmod +x /Library/WebServer/CGI-Executables/installer.cgi
chmod +x /Library/WebServer/CGI-Executables/openplex.cgi
chmod +x /Library/WebServer/CGI-Executables/webconnect.cgi


## copy files to /usr/bin for system wide access
cp 10.10vb.bash /usr/bin
cp appupdate.bash /usr/bin
cp appupdatebash.bash /usr/bin
cp appwebbash.bash /usr/bin
cp atvsettingsauto.bash /usr/bin
cp atvsettingsautobash.bash /usr/bin
cp auto.bash /usr/bin
cp backup.bash /usr/bin
cp backupbash.bash /usr/bin
cp backupatvsettings.bash /usr/bin
cp backupatvsettingsbash.bash /usr/bin
cp createautobash.bash /usr/bin
cp createcert.bash /usr/bin
cp createcertbash.bash /usr/bin
cp createimovie.bash /usr/bin
cp createimoviebash.bash /usr/bin
cp createpurge.bash /usr/bin
cp createpurgebash.bash /usr/bin
cp createwsj.bash /usr/bin
cp createwsjbash.bash /usr/bin
cp cyberghostbash.bash /usr/bin
cp falcobash.bash /usr/bin
cp hide /usr/bin
cp hide.bash /usr/bin
cp ibaabash.bash /usr/bin
cp icon.bash /usr/bin
cp install.bash /usr/bin
cp installbash.bash /usr/bin
cp itunes.bash /usr/bin
cp itunesbash.bash /usr/bin
cp lock.bash /usr/bin
cp lockbash.bash /usr/bin
cp loghigh.bash /usr/bin
cp loghighbash.bash /usr/bin
cp lognormal.bash /usr/bin
cp lognormalbash.bash /usr/bin
cp muteboot.bash /usr/bin
cp pht.bash /usr/bin
cp phtbash.bash /usr/bin
cp pmsbash.bash /usr/bin
cp pillow.bash /usr/bin
cp plexweb.bash /usr/bin
cp plexwebbash.bash /usr/bin
cp plexwebwan.bash /usr/bin
cp plexwebwanbash.bash /usr/bin
cp plexwebios.bash /usr/bin
cp plexwebiosbash.bash /usr/bin
cp plexwebioswan.bash /usr/bin
cp plexwebioswanbash.bash /usr/bin
cp plexweblist.bash /usr/bin
cp plexweblistbash.bash /usr/bin
cp plexweblistwan.bash /usr/bin
cp plexweblistwanbash.bash /usr/bin
cp pms.bash /usr/bin
cp pmsscan.bash /usr/bin
cp pmsscanbash.bash /usr/bin
cp purge.bash /usr/bin
cp purgebash.bash /usr/bin
cp purgesettings.bash /usr/bin
cp purgesettingsbash.bash /usr/bin
cp pythonkiller.bash /usr/bin
cp pythonkillerbash.bash /usr/bin
cp quit /usr/bin
cp quit.bash /usr/bin
cp quititunes.bash /usr/bin
cp quititunesbash.bash /usr/bin
cp reboot.bash /usr/bin
cp rebootbash.bash /usr/bin
cp removeauto.bash /usr/bin
cp removeautobash.bash /usr/bin
cp removecerts.bash /usr/bin
cp removecertsbash.bash /usr/bin
cp removepurge.bash /usr/bin
cp removepurgebash.bash /usr/bin
cp restart.bash /usr/bin
cp restartbash.bash /usr/bin
cp restoreatvsettings.bash /usr/bin
cp restoreatvsettingsbash.bash /usr/bin
cp restore.bash /usr/bin
cp restorebash.bash /usr/bin
cp restorecertsbash.bash /usr/bin
cp restorecerts.bash /usr/bin
cp show /usr/bin
cp show.bash /usr/bin
cp shutdown.bash /usr/bin
cp shutdownbash.bash /usr/bin
cp sleep.bash /usr/bin
cp sleepbash.bash /usr/bin
cp start.bash /usr/bin
cp startbash.bash /usr/bin
cp status.bash /usr/bin
cp statusbash.bash /usr/bin
cp stoffezbash.bash /usr/bin
cp stop.bash /usr/bin
cp stopbash.bash /usr/bin
cp sudoersfix.bash /usr/bin
cp sudoersfixbash.bash /usr/bin
cp timemachine.bash /usr/bin
cp timemachinebash.bash /usr/bin
cp trashbase.bash /usr/bin
cp trashbasebash.bash /usr/bin
cp trash.bash /usr/bin
cp trashbash.bash /usr/bin
cp tv.bash /usr/bin
cp tvbash.bash /usr/bin
cp uninstallbash.bash /usr/bin
cp unmuteboot.bash /usr/bin
cp updatebash.bash /usr/bin
cp updaterbash.bash /usr/bin
cp updatewcbash.bash /usr/bin
cp utorrent.bash /usr/bin
cp utorrentbash.bash /usr/bin
cp wahlmanjbash.bash /usr/bin
cp wake.bash /usr/bin
cp wakebash.bash /usr/bin
cp wcdefault.bash /usr/bin
cp wcdefaultbash.bash /usr/bin
cp wcinstaller.bash /usr/bin
cp wcinstallerbash.bash /usr/bin
cp wcios.bash /usr/bin
cp wciosbash.bash /usr/bin
cp wclist.bash /usr/bin
cp wclistbash.bash /usr/bin
cp wcopenplex.bash /usr/bin
cp wcopenplexbash.bash /usr/bin
cp websharing.bash /usr/bin
cp websharingbash.bash /usr/bin
cp who.bash /usr/bin
cp whobash.bash /usr/bin
cp wol.bash /usr/bin
cp xml.bash /usr/bin

## replace __DEFAULTPATH__ in default createauto.bash
## save directly to the /usr/bin folder
sed -e "s/__DEFAULTPATH__/${InstallerPath//\//\\/}/" "${InstallerPath}/createauto.bash" > /usr/bin/createauto.bash

## replace __INSTALLERPATH__ in default createimovie.bash
## save directly to the /usr/bin folder
sed -e "s/__INSTALLERPATH__/${InstallerPath//\//\\/}/" "${InstallerPath}/createimovie.bash" > /usr/bin/createimovie.bash

## replace __INSTALLERPATH__ in default createwsj.bash
## save directly to the /usr/bin folder
sed -e "s/__INSTALLERPATH__/${InstallerPath//\//\\/}/" "${InstallerPath}/createwsj.bash" > /usr/bin/createwsj.bash

## replace __INSTALLERPATH__ in default createcert.bash
## save directly to the /usr/bin folder
sed -e "s/__INSTALLERPATH__/${InstallerPath//\//\\/}/" "${InstallerPath}/createcert.bash" > /usr/bin/createcert.bash

## replace __DEFAULTPATH__ in default createplist.bash
## save directly to the /usr/bin folder
sed -e "s/__DEFAULTPATH__/${InstallerPath//\//\\/}/" "${InstallerPath}/createplist.bash" > /usr/bin/createplist.bash

## replace __USERNAME__in default fixgit.bash
## save directly to the /usr/bin folder
##sed -e "s/__USERNAME__/$whoami/" "${DefaultPath}/fixgit.bash" > /usr/bin/fixgit.bash

## replace __INSTALLERPATH__ in default update.bash
## save directly to the /usr/bin folder
sed -e "s/__INSTALLERPATH__/${InstallerPath//\//\\/}/" "${DefaultPath}/update.bash" > /usr/bin/update.bash

## replace __INSTALLERPATH__ in default updater.bash
## save directly to the /usr/bin folder
sed -e "s/__INSTALLERPATH__/${InstallerPath//\//\\/}/" "${DefaultPath}/updater.bash" > /usr/bin/updater.bash

## replace __DEFAULTPATH__ in default webconnect.bash
## save directly to the /usr/bin folder
##sed -e "s/__DEFAULTPATH__/${InstallerPath//\//\\/}/" "${InstallerPath}/webconnect.bash" > /usr/bin/webconnect.bash

## fix permissions
chmod +x /usr/bin/10.10vb.bash
chmod +x /usr/bin/appupdate.bash
chmod +x /usr/bin/appupdatebash.bash
chmod +x /usr/bin/appwebbash.bash
chmod +x /usr/bin/atvsettingsauto.bash
chmod +x /usr/bin/atvsettingsautobash.bash
chmod +x /usr/bin/auto.bash
chmod +x /usr/bin/backupatvsettings.bash
chmod +x /usr/bin/backupatvsettingsbash.bash
chmod +x /usr/bin/backup.bash
chmod +x /usr/bin/backupbash.bash
chmod +x /usr/bin/createauto.bash
chmod +x /usr/bin/createautobash.bash
chmod +x /usr/bin/createcert.bash
chmod +x /usr/bin/createcertbash.bash
chmod +x /usr/bin/createimovie.bash
chmod +x /usr/bin/createimoviebash.bash
chmod +x /usr/bin/createpurge.bash
chmod +x /usr/bin/createpurgebash.bash
chmod +x /usr/bin/createwsj.bash
chmod +x /usr/bin/createwsjbash.bash
chmod +x /usr/bin/cyberghostbash.bash
chmod +x /usr/bin/falcobash.bash
chmod +x /usr/bin/hide
chmod +x /usr/bin/hide.bash
chmod +x /usr/bin/ibaabash.bash
chmod +x /usr/bin/icon.bash
chmod +x /usr/bin/install.bash
chmod +x /usr/bin/installbash.bash
chmod +x /usr/bin/itunes.bash
chmod +x /usr/bin/itunesbash.bash
chmod +x /usr/bin/lock.bash
chmod +x /usr/bin/lockbash.bash
chmod +x /usr/bin/loghigh.bash
chmod +x /usr/bin/loghighbash.bash
chmod +x /usr/bin/lognormal.bash
chmod +x /usr/bin/lognormalbash.bash
chmod +x /usr/bin/muteboot.bash
chmod +x /usr/bin/pht.bash
chmod +x /usr/bin/phtbash.bash
chmod +x /usr/bin/pillow.bash
chmod +x /usr/bin/plexweb.bash
chmod +x /usr/bin/plexwebbash.bash
chmod +x /usr/bin/plexwebwan.bash
chmod +x /usr/bin/plexwebwanbash.bash
chmod +x /usr/bin/plexwebios.bash
chmod +x /usr/bin/plexwebiosbash.bash
chmod +x /usr/bin/plexwebioswan.bash
chmod +x /usr/bin/plexwebioswanbash.bash
chmod +x /usr/bin/plexweblist.bash
chmod +x /usr/bin/plexweblistbash.bash
chmod +x /usr/bin/plexweblistwan.bash
chmod +x /usr/bin/plexweblistwanbash.bash
chmod +x /usr/bin/pms.bash
chmod +x /usr/bin/pmsbash.bash
chmod +x /usr/bin/pmsscan.bash
chmod +x /usr/bin/pmsscanbash.bash
chmod +x /usr/bin/purge.bash
chmod +x /usr/bin/purgebash.bash
chmod +x /usr/bin/purgesettings.bash
chmod +x /usr/bin/purgesettingsbash.bash
chmod +x /usr/bin/pythonkiller.bash
chmod +x /usr/bin/pythonkillerbash.bash
chmod +x /usr/bin/quit
chmod +x /usr/bin/quit.bash
chmod +x /usr/bin/quititunes.bash
chmod +x /usr/bin/quititunesbash.bash
chmod +x /usr/bin/reboot.bash
chmod +x /usr/bin/rebootbash.bash
chmod +x /usr/bin/removeauto.bash
chmod +x /usr/bin/removeautobash.bash
chmod +x /usr/bin/removecerts.bash
chmod +x /usr/bin/removecertsbash.bash
chmod +x /usr/bin/removepurge.bash
chmod +x /usr/bin/removepurgebash.bash
chmod +x /usr/bin/restart.bash
chmod +x /usr/bin/restartbash.bash
chmod +x /usr/bin/restore.bash
chmod +x /usr/bin/restorebash.bash
chmod +x /usr/bin/restoreatvsettings.bash
chmod +x /usr/bin/restoreatvsettingsbash.bash
chmod +x /usr/bin/restorecerts.bash
chmod +x /usr/bin/restorecertsbash.bash
chmod +x /usr/bin/show
chmod +x /usr/bin/show.bash
chmod +x /usr/bin/shutdown.bash
chmod +x /usr/bin/shutdownbash.bash
chmod +x /usr/bin/sleep.bash
chmod +x /usr/bin/sleepbash.bash
chmod +x /usr/bin/start.bash
chmod +x /usr/bin/startbash.bash
chmod +x /usr/bin/status.bash
chmod +x /usr/bin/statusbash.bash
chmod +x /usr/bin/stoffezbash.bash
chmod +x /usr/bin/stop.bash
chmod +x /usr/bin/stopbash.bash
chmod +x /usr/bin/sudoersfix.bash
chmod +x /usr/bin/sudoersfixbash.bash
chmod +x /usr/bin/timemachine.bash
chmod +x /usr/bin/timemachinebash.bash
chmod +x /usr/bin/trash.bash
chmod +x /usr/bin/trashbash.bash
chmod +x /usr/bin/trashbasebash.bash
chmod +x /usr/bin/tv.bash
chmod +x /usr/bin/tvbash.bash
chmod +x /usr/bin/uninstallbash.bash
chmod +x /usr/bin/unmuteboot.bash
chmod +x /usr/bin/update.bash
chmod +x /usr/bin/updatebash.bash
chmod +x /usr/bin/updatewcbash.bash
chmod +x /usr/bin/updater.bash
chmod +x /usr/bin/updaterbash.bash
chmod +x /usr/bin/utorrent.bash
chmod +x /usr/bin/utorrentbash.bash
chmod +x /usr/bin/wahlmanjbash.bash
chmod +x /usr/bin/wake.bash
chmod +x /usr/bin/wakebash.bash
chmod +x /usr/bin/wcdefault.bash
chmod +x /usr/bin/wcdefaultbash.bash
chmod +x /usr/bin/wcinstaller.bash
chmod +x /usr/bin/wcinstallerbash.bash
chmod +x /usr/bin/wcios.bash
chmod +x /usr/bin/wciosbash.bash
chmod +x /usr/bin/wclist.bash
chmod +x /usr/bin/wclistbash.bash
chmod +x /usr/bin/wcopenplex.bash
chmod +x /usr/bin/wcopenplexbash.bash
chmod +x /usr/bin/websharing.bash
chmod +x /usr/bin/websharingbash.bash
chmod +x /usr/bin/who.bash
chmod +x /usr/bin/whobash.bash
chmod +x /usr/bin/wol.bash
chmod +x /usr/bin/xml.bash

if [ -s /Applications/PlexConnect/update/OSX/appwebhome.bash ]
then
chmod +x /Applications/PlexConnect/update/OSX/appwebhome.bash
fi
if [ -s /Applications/PlexConnect/update/OSX/airplay.bash ]
then
chmod +x /Applications/PlexConnect/update/OSX/airplay.bash
fi
if [ -s /Applications/PlexConnect/update/OSX/clt.bash ]
then
chmod +x /Applications/PlexConnect/update/OSX/clt.bash
fi
if [ -s /Applications/PlexConnect/update/OSX/shairport.bash ]
then
chmod +x /Applications/PlexConnect/update/OSX/shairport.bash
fi
if [ -s /Applications/PlexConnect/update/OSX/storefront.bash ]
then
chmod +x /Applications/PlexConnect/update/OSX/storefront.bash
fi
if [ -s /Applications/PlexConnect/update/OSX/PlexConnect.bash ]
then
chmod +x /Applications/PlexConnect/update/OSX/PlexConnect.bash
fi
if [ -s /usr/bin/uninstall.bash ]
then
chmod +x /usr/bin/uninstall.bash
fi

## Themes
## appwewebhome.bash fixes these permissions due to users home dir requirement

## PlexConnect Commands
## appwewebhome.bash fixes appweb.bash
chmod 4755 /usr/bin/backupatvsettings.bash
chmod 4755 /usr/bin/restoreatvsettings.bash
chmod 4755 /usr/bin/backup.bash
chmod 4755 /usr/bin/restore.bash
chmod 4755 /usr/bin/loghigh.bash
chmod 4755 /usr/bin/lognormal.bash
chmod 4755 /usr/bin/updater.bash
chmod 4755 /usr/bin/start.bash
chmod 4755 /usr/bin/stop.bash
chmod 4755 /usr/bin/restart.bash
chmod 4755 /usr/bin/status.bash
## appwewebhome.bash fixes updatewc.bash

## Hijacks
chmod 4755 /usr/bin/restorecerts.bash
chmod 4755 /usr/bin/removecerts.bash
chmod 4755 /usr/bin/createcert.bash
chmod 4755 /usr/bin/createimovie.bash
chmod 4755 /usr/bin/createwsj.bash

## PMS/OS X
chmod 4755 /usr/bin/pmsscan.bash
chmod 4755 /usr/bin/pms.bash
chmod 4755 /usr/bin/pht.bash
chmod 4755 /usr/bin/tv.bash
chmod 4755 /usr/bin/utorrent.bash
chmod 4755 /usr/bin/itunes.bash
chmod 4755 /usr/bin/quititunes.bash

## OS X
chmod 4755 /usr/bin/trash.bash
chmod 4755 /usr/bin/who.bash
chmod 4755 /usr/bin/whobash.bash
chmod 4755 /usr/bin/shutdown.bash
chmod 4755 /usr/bin/wake.bash
chmod 4755 /usr/bin/sleep.bash
chmod 4755 /usr/bin/lock.bash
chmod 4755 /usr/bin/reboot.bash


## Import LAN and WAN IP's into webconnect cgi files
plexwebbash.bash
plexwebwan.bash
plexwebios.bash
plexwebioswan.bash
plexweblist.bash
plexweblistwan.bash
wclist.bash
wcinstaller.bash
wcios.bash
wcdefault.bash
wcopenplex.bash

if [ -s /usr/bin/sudoers.bash ]
then
rm /usr/bin/sudoers.bash
fi

if [ -s /wclist.bash ]
then
rm /wclist.bash
fi

if [ -s /wcinstaller.bash ]
then
rm /wcinstaller.bash
fi

if [ -s /wcios.bash ]
then
rm /wcios.bash
fi

if [ -s /wcdefault.bash ]
then
rm /wcdefault.bash
fi

if [ -s /wcopenplex.bash ]
then
rm /wcopenplex.bash
fi

if [ -s /plexweb.bash ]
then
rm /plexweb.bash
fi

if [ -s /plexwebwan.bash ]
then
rm /plexwebwan.bash
fi

if [ -s /plexwebios.bash ]
then
rm /plexwebios.bash
fi

if [ -s /plexwebioswan.bash ]
then
rm /plexwebioswan.bash
fi

if [ -s /plexweblist.bash ]
then
rm /plexweblist.bash
fi

if [ -s /plexweblistwan.bash ]
then
rm /plexweblistwan.bash
fi

if [ -s /plexwebios.bash ]
then
rm /plexwebios.bash
fi

if [ -s /xml.bash ]
then
rm /xml.bash
fi

if [ -s /Applications/plexconnect_BACKUP ]
then
chmod -R 777 /Applications/plexconnect_BACKUP
fi

echo 'WebConnect has been updated. Refresh your browser if no icons appear.'
