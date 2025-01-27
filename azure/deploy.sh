#!/bin/bash

# Variables
RESOURCE_GROUP="myResourceGroup"
LOCATION="eastus"
DEPLOYMENT_NAME="myDeployment"

# Create resource group
az group create --name $RESOURCE_GROUP --location $LOCATION

# Deploy resources
az deployment group create --resource-group $RESOURCE_GROUP --template-file azuredeploy.json --name $DEPLOYMENT_NAME

echo "Deployment completed successfully."
