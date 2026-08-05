#!/bin/bash

echo "================================"
echo " AWS Linux Operations Toolkit"
echo " EC2 Manager"
echo "================================"

echo ""
echo "Current EC2 Instances:"
echo ""

aws ec2 describe-instances \
  --query 'Reservations[*].Instances[*].[InstanceId,State.Name,PublicIpAddress]' \
  --output table

