#!/bin/bash

set -eu

om_url=$(credhub get -n /concourse/main/testflight_opsman_url -q)
om_user=$(credhub get -n /concourse/main/testflight_opsman_api_username -q)
om_pass=$(credhub get -n /concourse/main/testflight_opsman_api_password -q)

om -t $om_url -u $om_user -p $om_pass -k "$@"
