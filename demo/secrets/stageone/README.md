az identity create -g msignite-migration -n msignite -o json

{
  "clientId": "2429d07c-571f-4c55-be28-8b63d630120e",
  "clientSecretUrl": "https://control-westeurope.identity.azure.net/subscriptions/ece781f9-3b74-475c-a7b1-124bf2c313b0/resourcegroups/msignite-migration/providers/Microsoft.ManagedIdentity/userAssignedIdentities/msignite/credentials?tid=e8b6df04-7cb4-4734-9f86-a5d396c56276&oid=dd460ce8-6aca-4353-a7dc-51d798a51c9d&aid=2429d07c-571f-4c55-be28-8b63d630120e",
  "id": "/subscriptions/ece781f9-3b74-475c-a7b1-124bf2c313b0/resourcegroups/msignite-migration/providers/Microsoft.ManagedIdentity/userAssignedIdentities/msignite",
  "location": "westeurope",
  "name": "msignite",
  "principalId": "dd460ce8-6aca-4353-a7dc-51d798a51c9d",
  "resourceGroup": "msignite-migration",
  "tags": {},
  "tenantId": "e8b6df04-7cb4-4734-9f86-a5d396c56276",
  "type": "Microsoft.ManagedIdentity/userAssignedIdentities"
}

az role assignment create \
  --role Reader \
  --assignee dd460ce8-6aca-4353-a7dc-51d798a51c9d \
  --scope /subscriptions/ece781f9-3b74-475c-a7b1-124bf2c313b0/resourcegroups/msignite-migration

{
  "canDelegate": null,
  "id": "/subscriptions/ece781f9-3b74-475c-a7b1-124bf2c313b0/resourcegroups/msignite-migration/providers/Microsoft.Authorization/roleAssignments/4dfad8e9-c9bc-4976-8b55-fc859d678247",
  "name": "4dfad8e9-c9bc-4976-8b55-fc859d678247",
  "principalId": "dd460ce8-6aca-4353-a7dc-51d798a51c9d",
  "principalType": "ServicePrincipal",
  "resourceGroup": "msignite-migration",
  "roleDefinitionId": "/subscriptions/ece781f9-3b74-475c-a7b1-124bf2c313b0/providers/Microsoft.Authorization/roleDefinitions/acdd72a7-3385-48ef-bd42-f606fba81ae7",
  "scope": "/subscriptions/ece781f9-3b74-475c-a7b1-124bf2c313b0/resourcegroups/msignite-migration",
  "type": "Microsoft.Authorization/roleAssignments"
}

az role assignment create \
  --role "Managed Identity Operator" \
  --assignee 766c0530-fc93-455f-b1a6-f7703f70d925 \
  --scope /subscriptions/ece781f9-3b74-475c-a7b1-124bf2c313b0/resourcegroups/msignite-migration