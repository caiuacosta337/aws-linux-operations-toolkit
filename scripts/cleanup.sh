#!/bin/bash

echo ""
echo "Available EC2 Instances"
echo "======================="

aws ec2 describe-instances \
  --query "Reservations[*].Instances[*].[InstanceId,State.Name]" \
  --output table

echo ""
read -p "Enter Instance ID to terminate: " INSTANCE_ID

echo ""
read -p "Type DELETE to confirm: " CONFIRM

if [ "$CONFIRM" != "DELETE" ]; then
    echo "Operation cancelled."
    exit 0
fi

aws ec2 terminate-instances \
  --instance-ids "$INSTANCE_ID"

echo ""
echo "Termination request submitted."
