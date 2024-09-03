
start_process() {
  #
  # start_process scriptname command
  #
  # Function to start the process
  #
  local SCRIPT_NAME=$1
  local PROCESS_CMD=$2

  if [ -z $SCRIPT_NAME ]; then
    echo 'Error: No argument "scriptname" specified' >&2
    exit 1
  fi

  if [ -z "$PROCESS_CMD" ]; then
    echo 'Error: No argument "command" specified' >&2
    exit 1
  fi

  local PID_FILE="/var/run/$SCRIPT_NAME.pid"

  if [ -f "$PID_FILE" ]; then
    echo "Error: $SCRIPT_NAME is already running" >&2
    exit 1
  fi

  echo "Starting $SCRIPT_NAME..."
  $PROCESS_CMD &
  echo $! > "$PID_FILE"
  echo "$SCRIPT_NAME started with PID $(cat $PID_FILE)"
}

stop_process() {
  #
  # stop_process scriptname
  #
  # Function to stop the process
  #
  local SCRIPT_NAME=$1

  if [ -z $SCRIPT_NAME ]; then
    echo 'Error: No argument "scriptname" specified' >&2
    exit 1
  fi

  local PID_FILE="/var/run/$SCRIPT_NAME.pid"

  if [ ! -f "$PID_FILE" ]; then
    echo "Error: $SCRIPT_NAME is not running" >&2
    exit 1
  fi

  echo "Stopping $SCRIPT_NAME..."
  PID=$(cat "$PID_FILE")
  kill $PID
  rm "$PID_FILE"
  echo "$SCRIPT_NAME stopped"
}

status_process() {
  # Functions to check process status
  local SCRIPT_NAME=$1

  if [ -z $SCRIPT_NAME ]; then
    echo 'Error: No argument "scriptname" specified' >&2
    exit 1
  fi

  local PID_FILE="/var/run/$SCRIPT_NAME.pid"

    if [ -f "$PID_FILE" ]; then
        echo "$SCRIPT_NAME is running with PID $(cat $PID_FILE)"
    else
        echo "$SCRIPT_NAME is not running"
    fi
}
