locals {
  common_name = "${var.project}-${terraform.workspace}"
  common_tags={
    project = var.project
    terraform=true
  }
}