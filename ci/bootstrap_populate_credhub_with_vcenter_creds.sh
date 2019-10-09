#!/bin/bash
set -eu
credhub set -t value -n /concourse/main/testflight_vcenter_user -v $GOVC_USERNAME
credhub set -t password -n /concourse/main/testflight_vcenter_password -w $GOVC_PASSWORD
credhub set -t value -n /concourse/main/testflight_opsman_ssh_public_key -v "$(cat ~/.ssh/*.pub)" # Assume we on the Tools VM used for all connectivity so configure the public key from here

