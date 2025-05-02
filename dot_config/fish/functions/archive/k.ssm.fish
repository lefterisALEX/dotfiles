function k.ssm
  aws ssm start-session --target $(k.instanceid $argv)
end
