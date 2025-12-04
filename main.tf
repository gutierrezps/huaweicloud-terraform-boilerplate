data "huaweicloud_enterprise_project" "main" {
  name = var.enterprise_project
}

locals {
  enterprise_project_id = data.huaweicloud_enterprise_project.main.id
}

resource "huaweicloud_vpc" "main" {
  name                  = "vpc-boilerplate"
  cidr                  = "192.168.0.0/16"
  enterprise_project_id = local.enterprise_project_id
}

resource "huaweicloud_vpc_subnet" "main" {
  name              = "subnet-boilerplate"
  cidr              = "192.168.0.0/24"
  gateway_ip        = "192.168.0.1"
  vpc_id            = huaweicloud_vpc.main.id
  availability_zone = var.availability_zone
}
