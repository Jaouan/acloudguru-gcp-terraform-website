#!/bin/bash

# - Login.
echo "👉 Login with playground account"
gcloud auth login

# - Extracting useful data.
GCP_ACCESS_TOKEN=`gcloud auth print-access-token`
GCP_PROJECT=`gcloud projects list|grep playground|awk '{ print $1 }'`

# - Injecting configuration.
echo "🙌 Configuring ./provider.tf to use ${GCP_PROJECT}"
echo "provider \"google\" {
  access_token = \"${GCP_ACCESS_TOKEN}\"
  project      = \"${GCP_PROJECT}\"
  region       = \"us-central1\"
}" > ./provider.tf

# - Clean outdated files.
rm -Rf terraform.tfstate* .terraform/ .terraform.lock*

# - Initialize terraform.
echo "🚀 Initializing Terraform"
terraform init
