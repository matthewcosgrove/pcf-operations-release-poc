#!/bin/bash
set -eu

REPO_ROOT_DIR="$(dirname $( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd ))"
INPUT_VARS_YAML=$REPO_ROOT_DIR/ci/testflight-deployment/infra-settings.yml
credhub set -t value -n /concourse/main/testflight_opsman_ip -v "$(bosh int --path=/opsman_ip $INPUT_VARS_YAML)"
credhub set -t value -n /concourse/main/testflight_opsman_url -v "https://$(bosh int --path=/opsman_ip $INPUT_VARS_YAML)"
