#!/bin/bash
set -eu
credhub set -t value -n /concourse/main/testflight_vcenter_ip -v $GOVC_URL
credhub set -t value -n /concourse/main/testflight_vcenter_datacenter -v $GOVC_DATACENTER
credhub set -t value -n /concourse/main/testflight_vcenter_user -v $GOVC_USERNAME
credhub set -t password -n /concourse/main/testflight_vcenter_password -w $GOVC_PASSWORD
