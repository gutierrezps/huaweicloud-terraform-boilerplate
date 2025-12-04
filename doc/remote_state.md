# Configuring Remote State Storage in Terraform

🔙 Back to [README](../README.md).

🌐 **Language**: **English** | [Português](./remote_state.pt.md)

- [Configuring Remote State Storage in Terraform](#configuring-remote-state-storage-in-terraform)
  - [Introduction](#introduction)
  - [First Steps](#first-steps)
    - [OBS bucket and access credentials](#obs-bucket-and-access-credentials)
    - [Environment variable loading](#environment-variable-loading)
  - [How it's implemented in this boilerplate](#how-its-implemented-in-this-boilerplate)
  - [I want to store my state file locally](#i-want-to-store-my-state-file-locally)
  - [References](#references)

## Introduction

By default, Terraform stores state locally in a file named `terraform.tfstate`.
When working with Terraform in a team, use of a local file makes Terraform
usage complicated because each user must make sure they always have the latest
state data before running Terraform and make sure that nobody else runs
Terraform at the same time.

With remote state, Terraform writes the state data to a remote data store,
which can then be shared between all members of a team. Terraform supports
storing state in Terraform Cloud, HashiCorp Consul, Amazon S3, Azure Blob
Storage, Google Cloud Storage, etcd, and more.

As [Huawei Cloud OBS][obs] (Object Storage Service) can be compatible with the AWS S3
interface, and Amazon S3 backend supports custom endpoints, we can use S3
backend to store state files in Huawei Cloud OBS.

## First Steps

If it's the first time you are deploying the boilerplate, do the following:

### OBS bucket and access credentials

If you already have an OBS bucket and access credentials:

1. Make a copy of `.env.example` file named `.env` and update with the Access
   Key (AK) and Secret Access Key (SK) with read-write permissions to the OBS
   bucket;
2. Update the `remote-state.tf` file with your OBS bucket details.

Otherwise, if you wish to create a new OBS bucket to store the state file:

1. Temporarily change the extension of `remote-state.tf` file to something
   else, so it's not processed when first running Terraform;
2. Choose a globally unique OBS bucket name to store your state file, and
   update the value of `obs_remote_state_bucket_name` in `terraform.tfvars`;
3. Run `terraform init` and `terraform apply` to create the OBS bucket and
   AK/SK to access it;
4. Make a copy of `.env.example` named `.env` and update the Access Key (AK)
   and Secret Access Key (SK) with the values output to
   `output/obs-credentials.csv` file;
5. Undo the extension change of `remote-state.tf` file and update it with your
   OBS bucket details.

### Environment variable loading

After setting up remote state storage according to the steps in the previous
section, load the environment variables depending on your operating system:

- If you're on Windows, run `. .\Set-EnvVars.ps1`;
- If you're on Linux, run `. set-env-vars.sh`;

After loading the environment variables, run the `terraform` commands as usual.

## How it's implemented in this boilerplate

The `remote-state.tf` file contains the required configuration to store the
Terraform state file in an Huawei Cloud OBS bucket.

The required environment variables are set using the `.env` file, which should
be derived from `.env.example` file.

The module `obs-remote-state` creates the required Huawei Cloud resources:

- IAM User with programmatic access;
- Credentials file `output/obs-credentials.csv` with AK/SK of this IAM User;
- OBS bucket for Terraform remote state file storage;
- OBS Bucket policy allowing read-write permission to the IAM User created.

If you already have an OBS bucket and an AK/SK to read-write files to the
bucket, then simply remove the `modules/obs-remote-state` folder and also
remove the module code from `remote-state.tf`.

## I want to store my state file locally

In that case, simply remove the `modules/obs-remote-state` folder and the
`remote-state.tf` file.

## References

Configure Remote State Backend for HuaweiCloud:
<https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs/guides/remote-state-backend>

[obs]: <https://support.huaweicloud.com/intl/en-us/obs/index.html>
