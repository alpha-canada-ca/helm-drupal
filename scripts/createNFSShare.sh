#!/bin/bash
export AZURE_STORAGE_CONNECTION_STRING=`az storage account show-connection-string --name tbsnfs --resource-group tbs-nfs-rg -o tsv`
echo ConnectionString:$AZURE_STORAGE_CONNECTION_STRING
az storage share create \
  --name $1 \
  --quota 1 \
  --connection-string $AZURE_STORAGE_CONNECTION_STRING \
  --fail-on-exist \
  --verbose 
export STORAGE_KEY=$(az storage account keys list --resource-group tbs-nfs-rg --account-name tbsnfs --query "[0].value" -o tsv)
echo StorageKey:$STORAGE_KEY
