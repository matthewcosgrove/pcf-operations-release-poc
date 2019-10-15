#!/bin/bash
set -eu

REPO_ROOT_DIR="$(dirname $( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd ))"
INPUT_VARS_YAML=$REPO_ROOT_DIR/ci/testflight-deployment/infra-settings.yml
# Keeping in credhub as need to parse array
credhub set -t value -n /concourse/main/testflight_vcenter_dns -v "$(bosh int --path=/vcenter_dns/0 $INPUT_VARS_YAML)"

