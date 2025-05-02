function tcloud.ingress.status.acc
  for i in $(tcloud.acc)
  kubie exec $i  ingress-nginx  kubectl get pods -owide
 end
end
