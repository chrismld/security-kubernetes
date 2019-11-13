az identity create -g msignite-migration -n msignite -o json

az role assignment create \
  --role Reader \
  --assignee $PRINCIPALID \
  --scope $SUBSCRIPTIONSCOPE

az role assignment create \
  --role "Managed Identity Operator" \
  --assignee $PRINCIPALID \
  --scope $SUBSCRIPTIONSCOPE