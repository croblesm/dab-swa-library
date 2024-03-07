# Azure Static Web Apps - Library Demo
## Overview
This is an end to end demo app that includes multiple Microsoft technologies, GitHub, Terraform and Azure services. The application consists on a basic library app that allows users to view a list of books and authors.  

This repository includes a Dev Container. If you are not familiar with Dev Containers, this is a pre-configured environment that allows you to develop and test the application (locally) in a consistent environment. The Dev Container includes all the tools and dependencies needed to run the application.

The application is developed using React and utilizes an Azure SQL database for data storage. You can choose to test the application locally or deploy it to Azure Static Web Apps. When deployed to Azure Static Web Apps, it utilizes the database connections feature to link with the Azure SQL database. A

> The local development environment is set up to utilize a SQL database container.

## Project Structure

The project structure is as follows:

```bash
dab-swa-library
├── .devcontainer
│   └── sql
├── .github
│   └── workflows
├── app
│   ├── public
│   └── src
│       └── Components
│           ├── AuthorList
│           └── BookList
├── infra
│   └── modules
│       └── azure_sql_web_app
├── sql
│   └── Library-v2.1
│       ├── Tables
│       ├── bin
│       │   └── Debug
│       └── obj
│           └── Debug
└── swa-db-connections
```

- The .devcontainer folder contains the Dev Container configuration. 
- The .github folder contains the GitHub Actions workflow to deploy the application to Azure Static Web Apps and the database to Azure SQL Database.
- The app folder contains the React application. 
- The infra folder contains the Terraform configuration to deploy the Azure SQL database and the Azure Static Web App. 
- The sql folder contains the SQL Data project used to create the database and its objects.
- The swa-db-connections folder contains the database connection configuration for the Azure Static Web App.

## Features

This project uses the database connections feature of Static Web Apps to provide the following functionality:

* CRUD access to database contents with REST or GraphQL
* Built-in authorization with Static Web Apps authentication
* Support for database relationships with GraphQL

## Getting Started

### Prerequisites
1. An Azure SQL database with the tables created
2. NodeJS
3. An Azure Static Web App resource

### To get started with the Dev Container
1. Clone this repository
1. Open VS Code
1. Install the Remote - Containers extension
1. Open the repository in a Dev Container

### To get started locally
1. Navigate to the `app` directory
2. Initiliaze the Static Web App CLI with `swa init` as follows:
`swa db init --database-type mssql --connection-string 'Server=localhost;Database=library;User ID=SA;Password=P@ssw0rd!;TrustServerCertificate=true'`
3. This step will create a new folder called `swa-db-connections` with a file called `staticwebapp.database.config.json` that contains the database connection configuration
4. Navigate to the `swa-db-connections` directory and remove the `connection-string` property from the `staticwebapp.database.config.json` file
5. Create an `.env` file in the `swa-db-connections` directory with the following content:
`CONN_STRING=Server=localhost;Database=library;User ID=SA;Password=P@ssw0rd!;TrustServerCertificate=true` 
> This will ensure you don't have to expose the connection string in the `staticwebapp.database.config.json` file
6. Run `swa start http://localhost:3000 --run "cd app && npm i && npm start" --data-api-location swa-db-connections`
    * `cd library-demo && npm i && npm start` will install needed npm packages and run your React app
    * `--data-api-location swa-db-connections` indicates to the SWA CLI that your database connections configurations are in the `swa-db-connections` folder
    * Alternatively, you can start all these projects manually an make use of SWA CLI's other args
7. Open a web browser and navigate to `http://127.0.0.1:4280` to view the application

You can now use your Static Web App Library Demo Application. It supports authorization, such that anyone logged in with SWA CLI's authentication emulation with the `admin` role will have `CRUD` access, while anonymous users are limited to `read` access. See the configurations detailed in `staticwebapp.database.config.json` for more details.

### To deploy in Azure using Terraform

1. Commit all your changes and push to your repository.
1. Navigate to the `infra` directory
1. Update the `variable.tf` file with your Azure subscription ID and the name of the resource group where you want to deploy the resources
1. Run `terraform init` to initialize the Terraform configuration
1. Run `terraform apply` to deploy the Azure SQL database and the Azure Static Web App
1. Once the deployment is complete, navigate to the Azure portal and open the Static Web App resource
1. Go to the Database connection tab and link your database to your default environment
1. Navigate to the URL of your Static Web App to view the application
1. You can now use your Static Web App Library Demo Application. It supports authorization, such that anyone logged in with SWA CLI's authentication emulation with the `admin` role will have `CRUD` access, while anonymous users are limited to `read` access. See the configurations detailed in `staticwebapp.database.config.json` for more details.

### To deploy the database to Azure SQL Database
1. Navigate to the `sql` directory
1. Open the `Library-v2.1` project in Visual Studio
1. Build the project to generate the `.dacpac` file

### Configure GitHub Actions
1. Navigate to the `.github/workflows` directory
1. Open the `azure-static-web-apps-library-demo.yml` file
1. Update the `env` section with the values for your Azure subscription, resource group, and database connection string
1. Commit the changes to your repository
1. Navigate to the Actions tab in your repository to view the deployment status
1. Once the deployment is complete, navigate to the Azure portal and open the Static Web App resource
1. Go to the Database connection tab and link your database to your default environment
1. Navigate to the URL of your Static Web App to view the application
1. You can now use your Static Web App Library Demo Application. It supports authorization, such that anyone logged in with SWA CLI's authentication emulation with the `admin` role will have `CRUD` access, while anonymous users are limited to `read` access. See the configurations detailed in `staticwebapp.database.config.json` for more details.


### Troubleshooting
* Ensure your Azure database is configured to accept network requests
* Ensure that your configuration files have been placed in your repository and included in your build process. 
* Ensure that your managed identity has been configured within your database.