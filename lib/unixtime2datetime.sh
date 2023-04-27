#!/bin/bash
unixtime2datetime() {
  #
  # unixtime2datetime unixtime [timezone] [format]
  #
  _UNIXTIME=$1
  _TZ=${2:-'UTC'}
  _FORMAT=${3:-''}

  if [[ $_UNIXTIME =~ [^0-9]+ ]]; then
    echo 'Error: Invalid unixtime' 1>&2
    exit 1
  fi

  echo $(TZ=${_TZ} date --date "@$_UNIXTIME" $_FORMAT)
}