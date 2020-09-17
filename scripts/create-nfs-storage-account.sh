#!/bin/bash
az group create --location canadacentral --name tbs-nfs-rg
az storage account create \
    --name tbsnfs  \
    --resource-group tbs-nfs-rg \
    --location canadacentral \
    --sku Standard_LRS



