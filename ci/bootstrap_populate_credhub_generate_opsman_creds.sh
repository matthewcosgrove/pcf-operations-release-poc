#!/bin/bash
set -eu
credhub generate -t password -n /concourse/main/testflight_opsman_ssh_password # TODO: This should be generated during the OpsMan deployment within a Concourse task

credhub generate -t password -n /concourse/main/testflight_opsman_api_password
credhub generate -t password -n /concourse/main/testflight_opsman_decryption_passphrase

