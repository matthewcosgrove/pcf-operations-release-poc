#!/bin/bash
set -eu

PIPELINE_NAME=${PIPELINE_NAME:-pcf-operations-release}
credhub set -t value -n /concourse/main/$PIPELINE_NAME/git_repo_uri -v $PCF_OPERATIONS_RELEASE_GIT_REPO_URI
credhub set -t value -n /concourse/main/$PIPELINE_NAME/git_testflight_state_repo_uri -v $PCF_OPERATIONS_RELEASE_TESTFLIGHT_GIT_REPO_URI
