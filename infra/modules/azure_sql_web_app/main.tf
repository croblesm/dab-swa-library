variable "region" {}
variable "resource_group_suffix" {}
variable "sql_server_name" {}
variable "sql_database_name" {}
variable "sql_admin_login" {}
variable "sql_admin_password" {}
variable "web_app_name" {}

resource "random_integer" "suffix" {
  min = 10000
  max = 99999
}

resource "azurerm_resource_group" "rg" {
  name     = "${var.resource_group_suffix}-${random_integer.suffix.result}"
  location = var.region
}

resource "azurerm_mssql_server" "example" {
  name                         = "${var.sql_server_name}-${random_integer.suffix.result}"
  resource_group_name          = azurerm_resource_group.rg.name
  location                     = azurerm_resource_group.rg.location
  version                      = "12.0"
  administrator_login          = var.sql_admin_login
  administrator_login_password = var.sql_admin_password

  tags = {
    createdBy = "roblescarlos"
  }
}

resource "azurerm_mssql_firewall_rule" "example" {
  name                = "AllowAzureServices"
  server_id           = azurerm_mssql_server.example.id
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "0.0.0.0"
}

resource "azurerm_mssql_database" "example" {
  name                         = var.sql_database_name
  server_id                    = azurerm_mssql_server.example.id
  collation                    = "SQL_Latin1_General_CP1_CI_AS"
  max_size_gb                  = 10
  sku_name                     = "GP_Gen5_2"

  tags = {
    createdBy = "roblescarlos"
  }
}

locals {
  azuresql_conn_string = "Server=tcp:${azurerm_mssql_server.example.fully_qualified_domain_name},1433;Initial Catalog=${azurerm_mssql_database.example.name};Persist Security Info=False;User ID=${var.sql_admin_login};Password=${var.sql_admin_password};MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"
}

resource "azurerm_static_site" "example" {
  name                = "${var.web_app_name}-${random_integer.suffix.result}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  app_settings = {
    "CONN_STRING" = local.azuresql_conn_string
  }

  tags = {
    createdBy = "roblescarlos"
  }
}
