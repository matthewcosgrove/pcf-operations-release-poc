#!/bin/bash
set -eu
credhub set -t value -n /concourse/main/pcf-operations-release/git_repo_uri -v $PCF_OPERATIONS_RELEASE_GIT_REPO_URI
credhub set -t value -n /concourse/main/pcf-operations-release/git_testflight_state_repo_uri -v $PCF_OPERATIONS_RELEASE_TESTFLIGHT_GIT_REPO_URI
