terraform {
  source = "${get_parent_terragrunt_dir()}/../../modules/container_registry"
}

include {
  path = find_in_parent_folders()
}


inputs = {
  resource_group_name = var.resource_group_name
  location = var.location
  tags = var.tags
}
  
}