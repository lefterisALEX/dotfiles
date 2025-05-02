function tcloud.ingress.status.all
 for i in $(tcloud.dev)
  kubie exec $i  ingress-nginx  kubectl get pods  -owide
 end
  for i in $(tcloud.acc)
  kubie exec $i  ingress-nginx  kubectl get pods -owide
 end
  for i in $(tcloud.prod)
  kubie exec $i  ingress-nginx  kubectl get pods -owide
 end
end
