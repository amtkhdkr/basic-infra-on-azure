# basic-infra-on-azure
A Proof of Concept to show how does one use Azure EKS to setup a multi user shared Terraform state for K8s


# NewCo's Infrastructure - Terragrunt Reference Architecture

This repository contains rather complete infrastructure configurations where [Terragrunt](https://github.com/gruntwork-io/terragrunt) is used to manage infrastructure for [NewCo Corporation](https://en.wikipedia.org/wiki/Placeholder_name#Companies_and_organizations).

## Philosophy

NewCo has several environments (prod, staging and dev) entirely separated by AWS accounts.

Infrastructure in each environment consists of multiple layers (autoscaling, alb, vpc, ...) where each layer is configured using one of [Terraform AWS modules](https://github.com/terraform-aws-modules/) with arguments specified in `terragrunt.hcl` in layer's directory.

[Terragrunt](https://github.com/gruntwork-io/terragrunt) is used to work with Terraform configurations which allows orchestrating of dependent layers, update arguments dynamically and keep configurations [DRY](https://en.wikipedia.org/wiki/Don%27t_repeat_yourself).

## Environments

Primary AWS region for all environments is `eu-central-1 (Frankfurt)`:

- `NewCo-prod` - Production configurations (AWS account - 111111111111)
- `NewCo-staging` - Staging configurations (AWS account - 444444444444)
- `NewCo-master` - Master AWS account (333333333333) contains:

  - AWS Organizations
  - IAM entities (users, groups)
  - ECR repositories
  - Route53 zones

  
## Pre-requirements

- [Terraform 0.12](https://www.terraform.io/intro/getting-started/install.html)
- [Terragrunt 0.22 or newer](https://terragrunt.gruntwork.io/docs/getting-started/install/)
- [Terraform Docs](https://github.com/segmentio/terraform-docs)
- [pre-commit hooks](http://pre-commit.com) to keep Terraform formatting and documentation up-to-date
- [direnv](https://github.com/direnv/direnv#setup) to automatically set correct environment variables per AWS account as specified in `.envrc` (optional)

If you are using macOS you can install all dependencies using [Homebrew](https://brew.sh/):

    $ brew install terraform terragrunt pre-commit

## Create and manage your infrastructure

Infrastructure consists of multiple layers (vpc, alb, ...) where each layer is described using one [Terraform module](https://www.terraform.io/docs/configuration/modules.html) with `inputs` arguments specified in `terragrunt.hcl` in respective layer's directory.

Navigate through layers to review and customize values inside `inputs` block.

There are two ways to manage infrastructure (slower&complete, or faster&granular):
- **Region as a whole (slower&complete).** Run this command to create infrastructure in all layers in a single region:

```
$ cd NewCo-prod/eu-central-1
$ terragrunt apply-all
```

- **As a single layer (faster&granular).** Run this command to create infrastructure in a single layer (eg, `vpc`):

```
$ cd NewCo-prod/eu-central-1/vpc
$ terragrunt apply
```

## References

* [Terraform documentation](https://www.terraform.io/docs/) and [Terragrunt documentation](https://terragrunt.gruntwork.io/docs/) for all available commands and features.
* [Terraform AWS modules](https://github.com/terraform-aws-modules/).
* [Terraform modules registry](https://registry.terraform.io/).
