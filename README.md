# Huawei Cloud Terraform Boilerplate

This project contains a minimal structure for Terraform projects using Huawei
Cloud provider, following some practices and references found around the
web (listed at the end).

[Huawei Cloud Terraform provider documentation](https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs)

## Structure

- `main.tf` - primary entrypoint
- `variables.tf` - declarations for variables
- `outputs.tf` - declarations for outputs
- `providers.tf` - list required providers, versions and configurations
- `terraform.tfvars` - derived from `terraform.tfvars.example`, contains custom
  values for variables. This file should not be commited to the repository.

## Style Convention

In order to ensure consistency across your project, follow some conventions:

- Use 2 spaces for indentation
- Align the equal signs inside a block
- Use empty lines to separate blocks
- Use only lowercase letters, digits and underscores (`_`) in resource
  identifiers. Do not use hyphens (`-`)

Except for identifiers naming, all the other conventions are automatically
applied by running `terraform fmt` command.

## References

- Terraform's [Standard Module Structure](https://developer.hashicorp.com/terraform/language/modules/develop/structure)
- Digital Ocean's [How To Structure a Terraform Project](https://www.digitalocean.com/community/tutorials/how-to-structure-a-terraform-project)
- Terraform's [Style Conventions](https://developer.hashicorp.com/terraform/language/syntax/style)
- Google Cloud's [Best practices for using Terraform](https://cloud.google.com/docs/terraform/best-practices-for-terraform)
