function tcloud.jump.dev1
asp kpn-iam ;set -x credentials (aws sts assume-role --role-arn arn:aws:iam::864699375984:role/kpn-developer --role-session-name containers --duration 28800); set -x access_key (echo $credentials | jq -r '.Credentials.AccessKeyId'); set -x secret_key (echo $credentials | jq -r '.Credentials.SecretAccessKey'); set -x session_token (echo $credentials | jq -r '.Credentials.SessionToken');

asp kpn-nonprod-techbase-containers ; aws ssm start-session --target i-0dee89e6c15495efb  --document-name AWS-StartInteractiveCommand  --parameters "command='sudo -u ubuntu env AWS_ACCESS_KEY_ID=$access_key  AWS_SECRET_ACCESS_KEY=$secret_key  AWS_SESSION_TOKEN=$session_token zsh -c \"cd ~ && exec zsh\"'"
end
