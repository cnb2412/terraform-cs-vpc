# -----------------------------------------------------------------------------
# REQUIRE A SPECIFIC TERRAFORM VERSION OR HIGHER
# This module has been updated with 0.12 syntax, 
# which means it is no longer compatible with any versions below 0.12.
# -----------------------------------------------------------------------------
terraform {
  required_version = ">= 0.12"
}


#### VPC

resource "cloudstack_vpc" "this" {
  name           = var.name
  cidr           = var.cidr
  vpc_offering   = var.vpc_offering
  zone           = var.zone
  network_domain = var.network_domain
  project        = var.project

  tags = merge(
    {
      "Name" = format("%s", var.name)
    },
    var.tags
  )
}


#### networks

resource "cloudstack_network" "priavte" {
  count = length(var.subnets) > 0 ? length(var.subnets) : 0

  name             = var.subnet_names[count.index]
  display_text     = var.subnet_names[count.index]
  cidr             = var.subnets[count.index]
  network_offering = length(var.subnet_offerings) == length(var.subnets) ? var.subnet_offerings[count.index] : var.default_network_offering
  zone             = var.zone
  vpc_id           = cloudstack_vpc.this.id
  project          = var.project

}

