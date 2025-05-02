function k.instanceid
  kubectl get node $argv  -o json | jq -r .spec.providerID | sed 's,.*/,,'
end
