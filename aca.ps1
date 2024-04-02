$RESOURCE_GROUP="rg-containerapps-azure-pipelines"
$LOCATION="westus"
$CONTAINERAPPS_ENVIRONMENT="aca-environment"
$CONTAINERAPPS_APP="album-backend-api"

az group create `
         --name $RESOURCE_GROUP `
         --location $LOCATION

az containerapp env create `
                --name $CONTAINERAPPS_ENVIRONMENT `
                --resource-group $RESOURCE_GROUP `
                --location $LOCATION

az containerapp create `
                --name $CONTAINERAPPS_APP `
                --resource-group $RESOURCE_GROUP `
                --environment $CONTAINERAPPS_ENVIRONMENT `
                --image mcr.microsoft.com/azuredocs/containerapps-helloworld:latest `
                --target-port 80 `
                --ingress 'external'