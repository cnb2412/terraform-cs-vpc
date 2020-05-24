# Apache CloudStack VPC Terraform module

Terraform module which creates VPC resources on Apache CloudStack Environments.

These types of resources are supported:

* [VPC](https://www.terraform.io/docs/providers/cloudstack/r/vpc.html)
* [Netowrk](https://www.terraform.io/docs/providers/cloudstack/r/network.html)


## Usage

```hcl
module "vpc" {
  source = "github.com/cnb2412/terraform-cs-vpc"

  name = "my-vpc"
  cidr = "10.0.0.0/16"
  vpc_offering = "Default VPC offering"
  zone         = "Zone-1"
  network_domain = "mynetork.local"
  project      = "myproject
  subnets     = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24"]
  subnet_names     = ["nw-1", "nw-2", "nw-3"]
  # either default_network_offering
  default_network_offering = "NAT for VPC"
  #or individual network offerings
  #subnet_offerings = ["NAT for VPC", "NAT for VPC with LoadBalancing", "NAT for VPC"]

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12 |

## Providers

| Name | Version |
|------|---------|
| cloudstack | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| cidr | The CIDR block for the VPC. Default value is a valid CIDR, but not acceptable by CS and should be overridden | `string` | `"0.0.0.0/0"` | no |
| default\_network\_acl\_id | Network ACL id that should be used, if not list is specified | `string` | `""` | no |
| default\_network\_offering | Network offering that should be used, if not list is specified | `string` | `""` | no |
| name | Name to be used on all resources as prefix | `string` | n/a | yes |
| network\_acl\_ids | A list of network ACL ids. | `list(string)` | `[]` | no |
| network\_domain | The default DNS domain for networks created in this VPC. Changing this forces a new resource to be created. | `string` | `""` | no |
| project | The name or ID of the project to deploy this instance to. Changing this forces a new resource to be created. | `string` | `""` | no |
| subnet\_names | A list of subnets/tiers names | `list(string)` | `[]` | no |
| subnet\_offerings | A list of cs networkoffering that should be used | `list(string)` | `[]` | no |
| subnets | A list of subnets/tiers inside the VPC | `list(string)` | `[]` | no |
| tags | A map of tags to add to all resources | `map(string)` | `{}` | no |
| vpc\_offering | The name or ID of the VPC offering to use for this VPC. Changing this forces a new resource to be created. | `string` | `""` | no |
| zone | Name or ID of the zone where the VPC should be deployed | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| network\_id | The IDs of the networks in the VPC |
| vpc\_display\_text | The CIDR block of the VPC |
| vpc\_id | The ID of the VPC |
| vpc\_source\_nat\_ip | The CIDR block of the VPC |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->