# Huawei Cloud Terraform Boilerplate

<!-- markdownlint-disable MD033 -->
<a href="https://www.huaweicloud.com/intl/en-us" target="_blank">
  <img src="https://console-static.huaweicloud.com/static/authui/20210202115135/public/custom/images/logo-en.svg"
    alt="Huawei Cloud" width="450px" height="102px">
</a>

🌐 **Language**: **English** | [Português](./README.pt.md)

This project contains a minimal structure for Terraform projects using Huawei
Cloud provider, following some practices and references found around the
web (listed at the end).

Read [Huawei Cloud Terraform provider documentation](https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs)
to know which resources are available and how to use them.

- [Huawei Cloud Terraform Boilerplate](#huawei-cloud-terraform-boilerplate)
  - [👣 First Steps](#-first-steps)
  - [� Structure](#-structure)
  - [✒ Style Convention](#-style-convention)
  - [🔍 References](#-references)

## [👣 First Steps](./doc/FIRST_STEPS.md)

If you are new to Terraform, read the [First Steps](./doc/FIRST_STEPS.md).

## 📋 Structure

- `main.tf` - primary entrypoint
- `variables.tf` - declarations for variables
- `outputs.tf` - declarations for outputs
- `providers.tf` - list required providers, versions and configurations
- `terraform.tfvars` - derived from `terraform.tfvars.example`, contains custom
  values for variables. This file should not be commited to the repository.

## ✒ Style Convention

In order to ensure consistency across your project, follow some conventions:

- Use 2 spaces for indentation
- Align the equal signs inside a block
- Use empty lines to separate blocks
- Use only lowercase letters, digits and underscores (`_`) in resource
  identifiers. Do not use hyphens (`-`)

Except for identifiers naming, all the other conventions are automatically
applied by running `terraform fmt` command.

## 🔍 References

- Terraform's [Standard Module Structure](https://developer.hashicorp.com/terraform/language/modules/develop/structure)
- Digital Ocean's [How To Structure a Terraform Project](https://www.digitalocean.com/community/tutorials/how-to-structure-a-terraform-project)
- Terraform's [Style Conventions](https://developer.hashicorp.com/terraform/language/syntax/style)
- Google Cloud's [Best practices for using Terraform](https://cloud.google.com/docs/terraform/best-practices-for-terraform)
