terraform {
  source = "${get_parent_terragrunt_dir()}/../../modules/service_principal"
}

include {
  path = find_in_parent_folders()
}


inputs = {

}