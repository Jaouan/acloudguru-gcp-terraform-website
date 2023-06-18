# Website on acloudguru GCP playground using Terraform

Here an example that show how to deploy a basic website on acloudguru GCP playground using Terraform.
The GCP playground is a bit limited, it is impossible to apply a Terraform with a service account. The project contains a script to configure Terraform to use the access token of the Google account.

1. In `main.tf`, replace the `BUCKET_NAME` with your own.
2. Configure Terraform to use acloudguru GCP playground account's access token.
```bash
./gcp-provider-configure.sh
```
3. Deploy.
```bash
terraform plan
terraform apply --auto-approve
```
  
🙌