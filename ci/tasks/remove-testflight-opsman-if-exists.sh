#!/bin/bash

set -eu
: "${GOVC_URL:? GOVC_URL must be set }"
: "${GOVC_DATACENTER:? GOVC_DATACENTER must be set }"
: "${GOVC_USERNAME:? GOVC_USERNAME must be set }"
: "${GOVC_PASSWORD:? GOVC_PASSWORD must be set }"
: "${OM_URL:? OM_URL must be set }"
: "${OM_USERNAME:? OM_USERNAME must be set }"
: "${OM_PASSWORD:? OM_PASSWORD must be set }"

state_yaml_location=config
state_yaml=$state_yaml_location/state.yml
if [ -f "$state_yaml" ]; then
    pushd $state_yaml_location > /dev/null
    upstream_repo=$(git remote -v | awk 'NR==1 {print $2}')
    popd > /dev/null
    echo "$state_yaml exists. Skipping removal of OpsMan VM. To enable removing the OpsMan VM, delete the state.yml file, commit and push to $upstream_repo"
    exit 0
else
    echo "$state_yaml does not exist. Proceeding with removal"
fi
echo "Removing all products from OpsManager"
om -t $OM_URL -u $OM_USERNAME -p $OM_PASSWORD -k delete-installation -f

export GOVC_INSECURE=true
opsman_ip=$(bosh int --path=/opsman-configuration/vsphere/private_ip interpolated-creds/config/opsman.yml)
echo "Starting opsman removal if exists for $opsman_ip"
set +e
echo "Output from vm.info for ip $opsman_ip NOTE: If VM does not exist the govc output will indicate so"
govc vm.info --vm.ip $opsman_ip 
echo "Executing vm.destroy.."
govc vm.destroy --vm.ip $opsman_ip 
set -e
echo "Completed opsman removal if exists for $opsman_ip"

