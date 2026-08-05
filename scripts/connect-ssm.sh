#!/bin/bash

echo ""
echo "Available SSM Managed Instances"
echo "==============================="
echo ""

aws ssm describe-instance-information \
  --query "InstanceInformationList[*].[InstanceId,PingStatus,PlatformName]" \
  --output table

echo ""

read -p "Enter Instance ID: " INSTANCE_ID

echo ""
echo "Connecting to instance: $INSTANCE_ID"
echo ""

aws ssm start-session \
  --target "$INSTANCE_ID"
