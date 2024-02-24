# Define the module and pass required variables
module "azure_sql_web_app" {
  source = "./modules/azure_sql_web_app"
  
  region                 = var.region
  resource_group_suffix  = var.resource_group_suffix
  sql_server_name        = var.sql_server_name
  sql_database_name      = var.sql_database_name
  sql_admin_login       = var.sql_admin_login
  sql_admin_password     = var.sql_admin_password
  web_app_name           = var.web_app_name
}
