#!/bin/bash
set -eu

REPO_ROOT_DIR="$(dirname $( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd ))"
: "${INPUT_VARS_YAML:? INPUT_VARS_YAML must be set}"

if [[ ! -f $INPUT_VARS_YAML ]];then
  echo "File not found: $INPUT_VARS_YAML"
  exit 1
fi

# Keeping in credhub as need to parse array
credhub set -t value -n /concourse/main/testflight_vcenter_dns -v "$(bosh int --path=/vcenter_dns/0 $INPUT_VARS_YAML)"

credhub set -t value -n /concourse/main/testflight_opsman_ip -v "$(bosh int --path=/opsman_ip $INPUT_VARS_YAML)"
credhub set -t value -n /concourse/main/testflight_opsman_url -v "https://$(bosh int --path=/opsman_ip $INPUT_VARS_YAML)"
credhub set -t value -n /concourse/main/testflight_opsman_api_username -v "$(bosh int --path=/testflight_opsman_api_username $INPUT_VARS_YAML)"

public_key=$(cat ~/.ssh/*.pub)
echo "Warning. This might not be desired behaviour as adding public key from your location where you are running this script. This means only you will be able to access the OpsMan over ssh"
echo "Adding testflight_opsman_ssh_public_key.."
echo "$public_key"
echo "TODO: Generate a key/pair for the testflight OpsMan in CredHub and create a script that can add the private key to the local SSH agent of anyone needing access to it"
echo "For further info see https://community.pivotal.io/s/article/generate-an-ssh-key-pair-for-installing-ops-manager-v2-6-on-vsphere"
credhub set -t value -n /concourse/main/testflight_opsman_ssh_public_key -v "$public_key" # Originally implemented on a lab with a shared account for its Tools VM so configuring that ssh key was sufficient
