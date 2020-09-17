#!/bin/bash
export AZURE_STORAGE_CONNECTION_STRING=`az storage account show-connection-string --name tbsnfs --resource-group tbs-nfs-rg -o tsv`
echo ConnectionString:$AZURE_STORAGE_CONNECTION_STRING
az storage share delete \
  --name $1 \
  --connection-string $AZURE_STORAGE_CONNECTION_STRING \
  --verbose 
