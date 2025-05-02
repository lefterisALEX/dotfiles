function tcloud.prometheus.top.all-prod
 kubie exec tcloud-prd1 kube-system  kubectl top pods -l app.kubernetes.io/instance=kube-prometheus-stack-prometheus
 kubie exec tcloud-de-prd1 kube-system  kubectl top pods -l app.kubernetes.io/instance=kube-prometheus-stack-prometheus
 kubie exec tcloud-itv-prd1 kube-system  kubectl top pods -l app.kubernetes.io/instance=kube-prometheus-stack-prometheus
end
