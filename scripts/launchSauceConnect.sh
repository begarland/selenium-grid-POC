#! /bin/bash

echo "enter the environment (qa, staging, prod):"  
read env_choice  


if [ "$env_choice" = "qa" ]; then
  bin/sauceconnect_osx -c qa-config.yml
elif [ "$env_choice" = "staging" ]; then
  bin/sauceconnect_osx -c staging-config.yml
elif [ "$env_choice" = "prod" ]; then
  bin/sauceconnect_osx -c prod-config.yml
else
  echo "exiting"
fi
