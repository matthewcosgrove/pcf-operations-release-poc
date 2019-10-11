#!/bin/bash

set -eu

ip=$(credhub get -n /concourse/main/minio_ip -q)
url=$(credhub get -n /concourse/main/minio_url -q)
access_key=$(credhub get -n /concourse/main/minio_access_key -q)
secret_key=$(credhub get -n /concourse/main/minio_secret_key -q)

echo "Minio:"
echo "  ip: ${ip}"
echo "  url: ${url}"
echo "  access_key: ${access_key}"
echo "  secret_key: ${secret_key}"
