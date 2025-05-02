function k.ec2-terminate
  kubectl drain $argv --ignore-daemonsets --delete-emptydir-data --force --timeout 5m ; 	sleep 10 ;aws ec2 terminate-instances --instance-ids "$(k.instanceid $argv)"
end
