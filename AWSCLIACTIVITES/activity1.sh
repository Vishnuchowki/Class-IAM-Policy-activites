 #!/bin/bash
 
instanceIds=$(aws ec2 describe-instances --filter "Name=tag:Env,Values=QA" "Name=instance-state-name,Values=running" --query "Reservations[].Instances[].InstanceId" --output text)

if [[ -n "${instanceIds}" ]]; then
    echo "The Instance Ids which will be shut down are ${instanceIds}"
    aws ec2 stop-instances --instance-ids ${instanceIds}
else 
   echo "No instance is found with matching criteria for Env=QA"
fi