#!/bin/bash
#
# pingconv.sh
# ===============
#
# Script to convert UNIXTIME in ping command to datetime format.
# Receive the output of the ping command on standard input.
#
# Usage:
#   pingconv.sh [-jh]
#
# Options:
#   -j  Convert UNIXTIME to JST
#   -h  Show help

# Function help() shows help
help() {
  awk 'NR > 2 {
    if (/^#/) { sub("^# ?", ""); print }
    else { exit }
  }' $0
}

# Check options
FLAG_J=FALSE
VALUE=
OPT=
while getopts jh OPT
do
  case $OPT in
    j)  FLAG_J=TRUE
        ;;
    h)  help
        exit 0
        ;;
    \?) help 1>&2
        exit 1
        ;;
  esac
done

# Convert standard input
while read LINE
do
  UNIXTIME_INT=$(echo $LINE | sed -E "s/^\[([0-9]+)(\.[0-9]+)?\].*$/\1/")
  UNIXTIME_DEC=$(echo $LINE | sed -E "s/^\[([0-9]+)(\.[0-9]+)?\].*$/\2/")
  DATA=$(echo $LINE | sed -E "s/^\[(.*)\](.*)$/\2/")
  if [[ "$UNIXTIME_INT" =~ ^[0-9]+$ ]]; then
    if [ $FLAG_J = "TRUE" ]; then
      TIMESTAMP_JST=$(($UNIXTIME_INT + 32400))
      TIMESTAMP=$(date +%Y-%m-%dT%H:%M:%S --date "@$TIMESTAMP_JST")
      echo "${TIMESTAMP}${UNIXTIME_DEC}+0900${DATA}"
    else
      TIMESTAMP=$(date +%Y-%m-%dT%H:%M:%S --date "@$UNIXTIME_INT")
      echo "${TIMESTAMP}${UNIXTIME_DEC}+0000${DATA}"
    fi
  else
    echo "$DATA"
  fi
done