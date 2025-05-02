function tcloud.prometheus.status.all
 for i in $(tcloud.dev)
  kubie exec $i  kube-system  kubectl get pods -l app.kubernetes.io/instance=kube-prometheus-stack-prometheus -owide
 end
  for i in $(tcloud.acc)
  kubie exec $i  kube-system  kubectl get pods -l app.kubernetes.io/instance=kube-prometheus-stack-prometheus -owide
 end
  for i in $(tcloud.prod)
  kubie exec $i  kube-system  kubectl get pods -l app.kubernetes.io/instance=kube-prometheus-stack-prometheus -owide
 end
end