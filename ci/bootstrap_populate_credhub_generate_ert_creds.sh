#!/bin/bash
set -eu
credhub generate -t password -n /concourse/main/testflight_ert_properties_credhub_key_encryption_passwords_0_key
credhub generate -t password -n /concourse/main/testflight_ert_properties_cloud_controller_encrypt_key
credhub generate -t password -n /concourse/main/testflight_ert_properties_nfs_volume_driver_enable_ldap_service_account_password
credhub generate -t certificate -n /concourse/main/testflight_ert_properties_networking_poe_ssl_certs_0_certificate -o testflight --self-sign
credhub generate -t certificate -n /concourse/main/testflight_ert_properties_uaa_service_provider_key_credentials -o testflight --self-sign


