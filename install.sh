#!/bin/bash
################################################################
##
## Zak's MegaRefresh Installer
## Version 0.9 - Batocera version
##
################################################################

mkdir -p /recalbox/scripts/megarefresh/
cd /recalbox/scripts/megarefresh/

wget https://github.com/fzacchi/megarefresh-batocera/archive/master.zip

unzip -oj master.zip
rm master.zip

chmod +x megarefresh-onstart.sh
chmod +x megarefresh-onend.sh

#cp "es_systems.cfg" "/usr/share/batocera/datainit/system/.emulationstation/"

if ! grep "<command>/recalbox" /usr/share/batocera/datainit/system/.emulationstation/es_systems.cfg ; then
	sed -i 's/"<command>"/"<command>/recalbox/scripts/megarefresh/megarefresh-onstart.sh %SYSTEM% %EMULATOR% %ROM% ; "/g' /usr/share/batocera/datainit/system/.emulationstation/es_systems.cfg
fi

if ! grep "megarefresh-onend.sh</command>" /usr/share/batocera/datainit/system/.emulationstation/es_systems.cfg ; then
	sed -i 's/"</command>"/" ; /recalbox/scripts/megarefresh/megarefresh-onend.sh</command>"/g' /usr/share/batocera/datainit/system/.emulationstation/es_systems.cfg
fi

if ! grep "#videoMode.changeMode(wantedGameMode)" /usr/lib/python2.7/site-packages/configgen/emulatorlauncher.py ; then
	sed -i 's/videoMode.changeMode(wantedGameMode)/#videoMode.changeMode(wantedGameMode)/g' /usr/lib/python2.7/site-packages/configgen/emulatorlauncher.py
fi

/recalbox/scripts/recalbox-save-overlay.sh

echo
echo "Zak's MegaRefresh Script v1.0 installed/updated successfully."

sleep 5
