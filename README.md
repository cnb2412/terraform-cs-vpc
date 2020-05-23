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