function aws-create-token
 switch $animal
     case cat
         echo evil
     case wolf dog human moose dolphin whale
         echo mammal
     case duck goose albatross
         echo bird
     case shark trout stingray
         echo fish
     # Note that the next case has a wildcard which is quoted
     case '*'
         echo I have no idea what a $animal is
 end
