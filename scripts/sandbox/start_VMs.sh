#!/bin/zsh

instance_array=(${(f)"$(gcloud compute instances list --format="value(NAME,ZONE)")"})

for instance in "${instance_array[@]}"
do
  read -rA current_instance <<<"$instance"
  echo "Found ${current_instance[1]} in zone ${current_instance[2]}"
  gcloud compute instances start ${current_instance[1]} --zone=${current_instance[2]}
done
