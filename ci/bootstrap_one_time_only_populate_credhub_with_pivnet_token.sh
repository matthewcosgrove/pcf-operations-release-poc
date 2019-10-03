#!/bin/bash
set -eu
credhub set -t password -n /concourse/main/pivnet-token -w $PIVNET_TOKEN
credhub set -t password -n /concourse/main/pivnet-refresh-token -w $PIVNET_TOKEN
