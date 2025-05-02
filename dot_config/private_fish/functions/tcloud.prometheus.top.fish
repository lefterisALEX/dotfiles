function tcloud.prometheus.top
 kubie exec $argv kube-system  kubectl top pods -l app.kubernetes.io/instance=kube-prometheus-stack-prometheus
end
