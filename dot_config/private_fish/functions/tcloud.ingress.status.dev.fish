function tcloud.ingress.status.dev
 for i in $(tcloud.dev)
  kubie exec $i  ingress-nginx  kubectl get pods  -owide
 end
end
