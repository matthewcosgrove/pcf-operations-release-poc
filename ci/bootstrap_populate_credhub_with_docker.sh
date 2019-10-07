#!/bin/bash
set -eu
credhub set -t value -n /concourse/main/ci_docker_image -v $DOCKER_IMAGE
credhub set -t value -n /concourse/main/ci_docker_image_tag -v $DOCKER_IMAGE_TAG
