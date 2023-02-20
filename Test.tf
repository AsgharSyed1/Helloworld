global_tags = {
  Provisioner  = "Terraform"
}
resource_groups = {
  eastus-rg1 = {
    location   = "eastus",
    tags       = {
      Owner      = "asgharsyed",
      CostCenter = "C1234",
      Description = "Resource group in East region"} }

  centralus-rg2 = {
    location   = "centralus",
    tags       = {
      Owner      = "asgharsyed",
      CostCenter = "C1234",
      Description = "Resource group in central us region"} }
}

#To create two resource group:
resource "azurerm_resource_group" "eastus-rg1" {
  name     = "eastus-rg1"
  location = "eastus"
}

resource "azurerm_resource_group" "centralus-rg2" {
  Name     = "centralus-rg2"
  Location = "centralus"
}

#To create two storage account:
data "azurerm_storage_account" "stacc-sa1" {
  name                     = "mystorageaccount"
  resource_group_name      = "${azurerm_resource_group.eastus-rg1.name}"
}

data "azurerm_storage_account" "stacc-sa2" {
  name                     = "mystorageaccount"
  resource_group_name      = "${azurerm_resource_group.centralus-rg2.name}"
}