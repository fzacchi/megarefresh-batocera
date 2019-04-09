#!/bin/bash
#========================================================================================================================
#
#title		: megarefresh-onend.sh - Zak's MegaRefresh script
#description	: This script performs the following:
#		: restores native LCD resolution and 60 Hz refresh after exiting game in Retropie
#		: companion to megarefresh-onstart.sh
#author		: Francesco Zacchi - fzlists@gmail.com
#date		: 2019-04-02
#version	: 1.4 - Batocera version
#notes		:
#
#========================================================================================================================

# skip if script toggle is set as disabled
if [ ! -f /recalbox/scripts/megarefresh/megarefresh-enabled ] ; then exit ; fi

# restore the monitor's native, preferred resolution and refresh rate only if it's been changed by -onstart
# else do nothing (shave a couple of seconds going back into EmulationStation)
if [ -f /recalbox/scripts/megarefresh/megarefresh-engaged ] ; then 
	
	tvservice -p > /dev/null
	sleep 0.2 && fbset -depth 8 && fbset -depth 16

fi

