#!/bin/bash
set -eu

# Keeping in credhub as need to parse array
credhub set -t value -n /concourse/main/testflight_vcenter_dns -v "$(bosh int --path=/vcenter_dns/0 $INPUT_VARS_YAML)"

# Everything below is deprecated as the preferred approach will be to externalise the vars file to a private git repo and have the pipeline dynamically produce the config/vars.yml for all non-sensitive vars (for better auditability of environment specific config)


credhub set -t value -n /concourse/main/testflight_vcenter_ip -v $GOVC_URL
credhub set -t value -n /concourse/main/testflight_vcenter_datacenter -v $GOVC_DATACENTER
REPO_ROOT_DIR="$(dirname $( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd ))"
INPUT_VARS_YAML=$REPO_ROOT_DIR/ci/testflight-deployment/infra-settings.yml
# Same name in infra-settings as in credhub so to test, MUST be deleted from credhub (as credhub interpolation happens first)
credhub set -t value -n /concourse/main/testflight_opsman_hostname -v "$(bosh int --path=/testflight_opsman_hostname $INPUT_VARS_YAML)"
credhub set -t value -n /concourse/main/testflight_opsman_vm_name -v "$(bosh int --path=/testflight_opsman_vm_name $INPUT_VARS_YAML)"

# To be deleted from credhub but not essential for testing
credhub set -t value -n /concourse/main/testflight_vcenter_ca_cert -v "$(bosh int --path=/vcenter_ca_cert $INPUT_VARS_YAML)" # must be type value to be used by create-vm.sh in Pivotal Platform Automation as defined in our config/opsman.yml
credhub set -t value -n /concourse/main/testflight_vcenter_host_full_govc_path -v "$(bosh int --path=/vcenter_host_full_govc_path $INPUT_VARS_YAML)"
credhub set -t value -n /concourse/main/testflight_vcenter_vms_full_govc_path -v "$(bosh int --path=/vcenter_vms_full_govc_path $INPUT_VARS_YAML)"
credhub set -t value -n /concourse/main/testflight_vcenter_resource_pool_full_govc_path -v "$(bosh int --path=/vcenter_resource_pool_full_govc_path $INPUT_VARS_YAML)"
credhub set -t value -n /concourse/main/testflight_opsman_ip -v "$(bosh int --path=/opsman_ip $INPUT_VARS_YAML)"
credhub set -t value -n /concourse/main/testflight_vcenter_network -v "$(bosh int --path=/network_name $INPUT_VARS_YAML)"
credhub set -t value -n /concourse/main/testflight_vcenter_datastore -v "$(bosh int --path=/vcenter_ds $INPUT_VARS_YAML)"
credhub set -t value -n /concourse/main/testflight_network_gateway -v "$(bosh int --path=/internal_gw $INPUT_VARS_YAML)"
credhub set -t value -n /concourse/main/testflight_vcenter_netmask -v "$(bosh int --path=/vcenter_netmask $INPUT_VARS_YAML)"
credhub set -t value -n /concourse/main/testflight_infra_ntp -v "$(bosh int --path=/infra_ntp $INPUT_VARS_YAML)"
credhub set -t value -n /concourse/main/testflight_opsman_url -v "https://$(bosh int --path=/opsman_ip $INPUT_VARS_YAML)"

# config/director-template.yml
credhub set -t value -n /concourse/main/testflight_vcenter_cluster -v "$(bosh int --path=/vcenter_cluster $INPUT_VARS_YAML)"
credhub set -t value -n /concourse/main/testflight_vcenter_rp -v "$(bosh int --path=/vcenter_rp $INPUT_VARS_YAML)"
credhub set -t value -n /concourse/main/testflight_network_cidr -v "$(bosh int --path=/internal_cidr $INPUT_VARS_YAML)"
credhub set -t value -n /concourse/main/testflight_pcf_opsman_director_config_reserved_ip_ranges -v "$(bosh int --path=/pcf_opsman_director_config_reserved_ip_ranges $INPUT_VARS_YAML)"
credhub set -t value -n /concourse/main/testflight_vcenter_disks -v "$(bosh int --path=/vcenter_disks $INPUT_VARS_YAML)"
credhub set -t value -n /concourse/main/testflight_vcenter_templates -v "$(bosh int --path=/vcenter_templates $INPUT_VARS_YAML)"
credhub set -t value -n /concourse/main/testflight_vcenter_vms -v "$(bosh int --path=/vcenter_vms $INPUT_VARS_YAML)"
