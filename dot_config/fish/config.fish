# ~/.config/fish/config.fish: DO NOT EDIT -- this file has been generated
# automatically by home-manager.

# Only execute this file once per shell.
set -q __fish_home_manager_config_sourced; and exit
set -g __fish_home_manager_config_sourced 1

# source /nix/store/zh0fax3j776b5cza8i02xmxdb83z92d4-hm-session-vars.fish

set -g theme_color_scheme dracula
set -g theme_display_aws_vault_profile yes
set -g theme_display_k8s_context yes
set -g theme_display_k8s_namespace yes
set -g theme_display_date no
set -g theme_nerd_fonts yes
set -g theme_newline_cursor yes
set -g direnv_fish_mode disable_arrow
set -Ux EDITOR nvim
set -gx PATH /Users/lefteris/.nix-profile/bin $PATH
# Felix' Fish Configuration Init File.

# Fix a problem with paging on nixos, will be resolved once fish version is
# updated. https://github.com/NixOS/nixpkgs/issues/85158

set PAGER less
set LESS -R

function awaketime -d "Display time since last waking."
    echo "Awake Since " \
        (pmset -g log | awk -e '/ Wake  /{print $2}' | tail -n 1)
end


function gitlog -d "More detailed, prettified output for git."
    git log --graph --abbrev-commit \
        --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset"
end


function k.nodes -d "details node output"
    kubectl get nodes \
        -o=custom-columns=NodeName:.metadata.name,ROLE:.metadata.labels."kpn\.org/role",EC2-type:.metadata.labels."beta\.kubernetes\.io/instance-type",Instance-type:.metadata.labels."kpn\.org/lifecycle",AZ:.metadata.labels."topology\.kubernetes\.io/zone",IP:.metadata..annotations."alpha\.kubernetes\.io/provided-node-ip",CPU:.status.capacity.cpu,Memory:.status.capacity.memory,PODS_number:.status.capacity.pods
end

function k.nodes.ingress -d "details node output"
    kubectl get nodes --selector=kpn.org/role=ingress \
        -o=custom-columns=NodeName:.metadata.name,ROLE:.metadata.labels."kpn\.org/role",EC2-type:.metadata.labels."beta\.kubernetes\.io/instance-type",Instance-type:.metadata.labels."kpn\.org/lifecycle",AZ:.metadata.labels."topology\.kubernetes\.io/zone",IP:.metadata..annotations."alpha\.kubernetes\.io/provided-node-ip",CPU:.status.capacity.cpu,Memory:.status.capacity.memory,PODS_number:.status.capacity.pods
end

function k.nodes.gpu -d "details node output"
    kubectl get nodes --selector=nvidia.com/gpu=true \
        -o=custom-columns=NodeName:.metadata.name,ROLE:.metadata.labels."kpn\.org/role",EC2-type:.metadata.labels."beta\.kubernetes\.io/instance-type",Instance-type:.metadata.labels."kpn\.org/lifecycle",AZ:.metadata.labels."topology\.kubernetes\.io/zone",IP:.metadata..annotations."alpha\.kubernetes\.io/provided-node-ip",CPU:.status.capacity.cpu,Memory:.status.capacity.memory,PODS_number:.status.capacity.pods
end

function k.instanceid
    kubectl get node $argv -o json | jq -r .spec.providerID | sed 's,.*/,,'
end


function kk
    kubectl get pods | source ~/.k8s_color
end


function k.ec2-terminate
    kubectl drain $argv --ignore-daemonsets --delete-emptydir-data --force --timeout 5m
    sleep 10
    aws ec2 terminate-instances --instance-ids "$(k.instanceid $argv)"
end

function k.ssm
    aws ssm start-session --target $(k.instanceid $argv)
end


function cws_cert_info
    echo | openssl s_client -connect $argv:443 2>/dev/null | openssl x509 -noout -subject -enddate -issuer
end

function tmux-clean
    tmux list-sessions | awk '!/^(ide|work):/ {print $1}' | sed 's/:$//' | xargs -I{} tmux kill-session -t {}
end

function bytes_to_mb_gb
    set bytes_size $argv[1]

    # Check if the argument is numeric
    if not math $bytes_size
        echo "Error: Please provide a numeric value in bytes."
        return
    end

    set mb_size (math "$bytes_size / (1024^2)")
    set gb_size (math "$bytes_size / (1024^3)")

    echo "$bytes_size bytes is equal to $gb_size GB"
    echo "$bytes_size bytes is equal to $mb_size MB"
end

function aws.ec2.list
    nu -c "aws ec2 describe-instances --query 'Reservations[].Instances[].{ID: InstanceId, IP: NetworkInterfaces[0].PrivateIpAddress, Type: InstanceType, State: State.Name, Name: Tags[?Key==`Name`]|[0].Value, LaunchTime: LaunchTime }' --output json | from json |select ID Name Type State IP LaunchTime| sort-by Name"
end

function aws.ec2.asg
    nu -c 'aws autoscaling describe-auto-scaling-groups | from json | get AutoScalingGroups | select AutoScalingGroupName MinSize MaxSize DesiredCapacity'
end

alias k='kubectl'
alias c='clear'
alias kx='kubie ctx'
alias kn='kubie ns'
alias g.log="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"
alias gl="git log --pretty=format:'%C(yellow)%h %<(24)%C(red)%ad %<(18)%C(green)%an %C(reset)%s' --date=local --max-count=10"
#port-forward
alias k.pf.alermanager 'kubectl -n kube-system port-forward svc/kube-prometheus-stack-alertmanager 9093:9093'
alias k.pf.prometheus 'kubectl -n kube-system port-forward svc/kube-prometheus-stack-prometheus 9090:9090'
alias k.pf.hubble-relay 'kubectl -n kube-system port-forward svc/hubble-relay 4245:80'
#alias z 'open -a /Applications/Zed.app -n'
#alias cd 'z'

if test -e /Users/lefteris/work-functions
    source /Users/lefteris/work-functions/work.fish
end
if test -e /home/lefteris/work-functions
    source /home/lefteris/work-functions/tcl.fun
end

# Conditionally add Homebrew environment setup if on macOS




status is-login; and begin

    # Login shell initialisation


end

status is-interactive; and begin

    # Abbreviations
    abbr --add -- cat 'bat -pP'
    abbr --add -- k.events 'kubectl get events --sort-by='\''.metadata.creationTimestamp'\'''
    abbr --add -- k.nodes.select.gpu 'kubectl get nodes  --selector=nvidia.com/gpu=true'
    abbr --add -- k.nodes.select.ingress 'kubectl get nodes  --selector=kpn.org/role=ingress'
    abbr --add -- ks 'kubectl --namespace=kube-system'
    abbr --add -- ksys 'kubie ns kube-system'
    abbr --add -- ll 'eza -la'
    abbr --add -- v nvim
    abbr --add -- vi nvim
    abbr --add -- vim nvim
    abbr --add -- zx 'zellij kill-all-sessions && zellij delete-all-sessions'

    # Aliases
    alias !! 'eval \$history[1]'
    alias gogit 'cd ~/git'
    alias lg lazygit

    # Interactive shell initialisation
    set fish_greeting
    #eval (zellij setup --generate-auto-start fish | string collect)
    direnv hook fish | source
    starship init fish | source

    # /nix/store/7xbdswfskyjyxq8hbzqzjxs3j2mrsh99-zoxide-0.9.4/bin/zoxide init fish | source
    zoxide init fish | source

    # add completions generated by Home Manager to $fish_complete_path
    begin
        set -l joined (string join " " $fish_complete_path)
        set -l prev_joined (string replace --regex "[^\s]*generated_completions.*" "" $joined)
        set -l post_joined (string replace $prev_joined "" $joined)
        set -l prev (string split " " (string trim $prev_joined))
        set -l post (string split " " (string trim $post_joined))
        set fish_complete_path $prev "/home/lefteris/.local/share/fish/home-manager_generated_completions" $post
    end

    # /nix/store/81cqmrlp1x77139nsx0s5jjqk6jxxxxw-direnv-2.34.0/bin/direnv hook fish | source


end
