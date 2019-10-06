#!/bin/bash

set -eu
: "${GOVC_URL:? GOVC_URL must be set }"
: "${GOVC_DATACENTER:? GOVC_DATACENTER must be set }"
: "${GOVC_USERNAME:? GOVC_USERNAME must be set }"
: "${GOVC_PASSWORD:? GOVC_PASSWORD must be set }"

export GOVC_INSECURE=true

RED='\033[0;31m'
GREEN='\033[0;32m'
NO_COLOR='\033[0m'

env | grep -v 'GOVC_PASSWORD' | grep 'GOVC_'
printf "\n"
result=1

set +e
printf "Testing vCenter connectivity...\n"
govc about
if [[ $? -ne 0 ]]; then
  printf "${RED}Failed!${NO_COLOR}\n\n"
  let result=0
else
  printf "${GREEN}OK.${NO_COLOR}\n\n"
fi
set -e

#Datacenter
set +e
printf "Checking existence of datacenter $GOVC_DATACENTER...\n"
govc datacenter.info $GOVC_DATACENTER
if [ $? -ne 0 ]; then
  printf "${RED}Failed!${NO_COLOR}\n\n"
  let result=0
else
  printf "${GREEN}OK.${NO_COLOR}\n\n"
fi
set -e

if [ $result -eq 1 ]; then
  printf "${GREEN}Success!${NO_COLOR}\n"
else
  printf "${RED}One or more checks failed! :(${NO_COLOR}\n"
  exit 1
fi
