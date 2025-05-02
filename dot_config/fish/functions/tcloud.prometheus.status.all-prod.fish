function tcloud.prometheus.status.all-prod
 kubie exec tcloud-prd1 kube-system  kubectl get pods -l app.kubernetes.io/instance=kube-prometheus-stack-prometheus -owide
 kubie exec tcloud-de-prd1 kube-system  kubectl get pods -l app.kubernetes.io/instance=kube-prometheus-stack-prometheus -owide
 kubie exec tcloud-itv-prd1 kube-system  kubectl get pods -l app.kubernetes.io/instance=kube-prometheus-stack-prometheus -owide
end
