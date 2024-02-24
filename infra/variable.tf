variable "resource_group_suffix" {
  description = "Resource group name"
  default     = "sqlbits2024-demos"
}

variable "region" {
  description = "Azure region where the resources will be deployed"
  default     = "eastus2"
}

variable "sql_server_name" {
  description = "Name of the Azure SQL Database server"
  default     = "library-db"
}

variable "sql_admin_login" {
  description = "Administrator login for Azure SQL Database"
  default     = "cloudadmin"
}

variable "sql_admin_password" {
  description = "Administrator password for Azure SQL Database"
  default     = "P@ssw0rd!"
}

variable "sql_database_name" {
  description = "Name of the Azure SQL Database"
  default     = "library"
}

variable "web_app_name" {
  description = "Name of the Azure Static Web App"
  default     = "library-app"
}