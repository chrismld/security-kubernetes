az keyvault create \
  --resource-group msignite-migration \
  --name msignitefrcma \
  --location westeurope

---

az keyvault secret set \
  --vault-name msignitefrcma \
  --name secretone \
  --value "mysensitivepass"

az keyvault secret set \
  --vault-name msignitefrcma \
  --name secrettwo \
  --value "othersensitivepass"

---
PrincipalID=$(az identity show \
  --name msignite \
  --resource-group msignite-migration \
  --output tsv \
  --query principalId)

ClientID=$(az identity show \
  --name msignite \
  --resource-group msignite-migration \
  --output tsv \
  --query clientId)

keyVaultID=$(az keyvault show \
  --name msignitefrcma \
  --resource-group msignite-migration \
  --output tsv \
  --query id)

---
# Grant general KeyVault access to the Azure Identity
az role assignment create \
   --role Reader \
   --assignee $PrincipalID \
   --scope $keyVaultID

# Grant GET Secret access to the Azure Identity
az keyvault set-policy \
   --name msignitefrcma \
   --secret-permissions get \
   --spn $ClientID
