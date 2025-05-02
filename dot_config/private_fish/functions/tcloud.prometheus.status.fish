function tcloud.prometheus.status
 kubie exec $argv kube-system  kubectl get pods -l app.kubernetes.io/instance=kube-prometheus-stack-prometheus -owide
end
