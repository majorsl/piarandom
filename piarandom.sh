#!/usr/bin/env bash
# Version 1.0
# To see all available regions use: "/Applications/Private Internet Access.app/Contents/MacOS/piactl" get regions

#path to PIA binary.
PIA="/Applications/Private Internet Access.app/Contents/MacOS/piactl"
CURRENTREGION=$("$PIA" get region)
NEWREGION=""

#random region function.
callnewregion () {
REGIONS=( 'austria' 'norway' 'greenland' 'iceland' 'poland' 'taiwan' 'india' 'egypt' 'ireland' 'switzerland' 'turkey' 'cyprus' 'netherlands' 'luxembourg' 'slovenia' 'bangladesh' )

NEWREGION="${REGIONS["$((RANDOM % ${#REGIONS[@]}))"]}"
}

#call new region check for duplicate.
callnewregion
while [ "$CURRENTREGION" = "$NEWREGION" ]
do
    callnewregion
done

#disconnect, set region, reconnect.
"$PIA" disconnect
"$PIA" set region "$NEWREGION"
"$PIA" connect

exit 0
