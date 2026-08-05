#!/bin/bash

echo ""
echo "Available EC2 Instances"
echo "======================="
echo ""

aws ec2 describe-instances \
  --query "Reservations[*].Instances[*].[InstanceId,State.Name]" \
  --output table

echo ""
read -p "Enter Instance ID to stop: " INSTANCE_ID

echo ""
echo "Stopping instance: $INSTANCE_ID"
echo ""

aws ec2 stop-instances \
  --instance-ids "$INSTANCE_ID"
