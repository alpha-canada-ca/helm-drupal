Helm Chart: Drupal (Based on work by Will and Zach from StatCan)
==================

## Prerequisites
1. Azure CLI (https://docs.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest)
2. kubectl (RUN: az aks install-cli)
3. helm (https://helm.sh/docs/intro/install/)

## Create Site/Instance on alpha

1. az login (one time)
2. az aks get-credentials (one time)
3. Git clone the helm chart. (git clone  alpha-canada-ca/helm-drupal )
4. cd helm-drupal
5. Create a copy of values-template-prod.yaml
6. Open Azure port and create a DNS entry for the new site. (https://portal.azure.com/#blade/HubsExtension/BrowseResource/resourceType/Microsoft.Network%2FdnsZones)
7. kubectl create namespace <namespacename> for example tbs-drupal
8.  run ./scripts/createNFSSecret.sh <namespacename> using the same namespace as above
9.  run ./scripts/createNFSShare.sh <publicshare> ex. tbs-public
10. run ./scripts/createNFSShare.sh <privateshare> ex. tbs-private
11. run ./scripts/createNFSShare.sh <themeshare> ex. tbs-themes
12. Update the following values within the copied values-template-prod.yaml file:
    - ##host## - With the URL of the drupal site for example drupal.tbs.alpha.canada.ca
    - ##hostsecret## - use the host but replace . with - ex. drupal-tbs-alpha-canada-ca
    - ##password## - set this to anything, it will be the "admin" password of the site
    - ##publicShare## - replace with name used for step 9
    - ##privateShare## - replace with name used for step 10
    - ##themesShare## - replace with name used for step 11
13. In the drupal folder run
    - helm install --name <prefix for workflows> --namespace <namespacename from step 7> -f <name of new values file> --timeout 2400 --wait .
    - Ex: helm install --name tbs --namespace tbs-drupal -f values-template-prod-tbs-drupal.yaml --timeout 2400 --wait .
14. Wait, the new site should install, and issues a valid cert. Login with "admin" and the password provided in the ##admin## location of the values template.



