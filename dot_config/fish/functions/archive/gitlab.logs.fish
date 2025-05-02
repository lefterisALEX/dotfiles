function gitlab.logs 
 curl -Lo  ~/Downloads/gitlab/gitlab.log "$argv"
 bat ~/Downloads/gitlab/gitlab.log  
end