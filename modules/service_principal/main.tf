resource "random_pet" "prefix" {}

resource "azuread_service_principal" "example" {
  name                = "${random_pet.prefix.id}-service_principal"
  application_id      =  var.client_id
  tags                =  var.tags
}
