#!/bin/sh

set -u

# User params
KIBANA_USER_PARAMS=$@
KIBANA_CONFIG=${KIBANA_CONFIG:="/opt/kibana/config/kibana.yml"}

# Internal params
KIBANA_CMD="/opt/kibana/bin/kibana ${KIBANA_USER_PARAMS}"

#######################################
# Echo/log function
# Arguments:
#   String: value to log
#######################################
log() {
  if [[ "$@" ]]; then echo "[`date +'%Y-%m-%d %T'`] $@";
  else echo; fi
}

install_marvel() {
  log "Installing Marvel Plugin."
  /opt/kibana/bin/kibana plugin --install elasticsearch/marvel/latest
  log "Marvel Plugin Installed"
}
#######################################
# Dump current $KIBANA_CONFIG
#######################################
print_config() {
  log "Current Kibana config $KIBANA_CONFIG:"
  printf '=%.0s' {1..100} && echo
  cat $KIBANA_CONFIG
  printf '=%.0s' {1..100} && echo
}

# Marvel support check
if [[ ${MARVEL_SUPPORT} == "true" || ${MARVEL_SUPPORT} == "yes" ]]; then
  install_marvel
fi

# Launch Kibana
log $KIBANA_CMD && print_config
$KIBANA_CMD
# Exit immidiately in case of any errors or when we have interactive terminal
if [[ $? != 0 ]] || test -t 0; then exit $?; fi
log "Kibana started with $KIBANA_CONFIG config" && log
