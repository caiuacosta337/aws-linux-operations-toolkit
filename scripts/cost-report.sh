#!/bin/bash

START_DATE=$(date +%Y-%m-01)
END_DATE=$(date +%Y-%m-%d)

echo ""
echo "================================================"
echo " Linux Cloud Admin - Cost Dashboard"
echo "================================================"

echo ""
echo "AWS Account"
echo "==========="

aws sts get-caller-identity \
  --query '[Account]' \
  --output text

echo ""
echo "Billing Period"
echo "=============="

echo "$START_DATE -> $END_DATE"

echo ""
echo "Total AWS Cost"
echo "=============="

aws ce get-cost-and-usage \
  --time-period Start=$START_DATE,End=$END_DATE \
  --granularity MONTHLY \
  --metrics UnblendedCost \
  --query 'ResultsByTime[*].Total.UnblendedCost.Amount' \
  --output text

echo " USD"

echo ""
echo "Cost by Service"
echo "==============="

aws ce get-cost-and-usage \
  --time-period Start=$START_DATE,End=$END_DATE \
  --granularity MONTHLY \
  --metrics UnblendedCost \
  --group-by Type=DIMENSION,Key=SERVICE \
  --query 'ResultsByTime[*].Groups[*].[Keys[0],Metrics.UnblendedCost.Amount]' \
  --output table

echo ""
echo "Running EC2"
echo "==========="

aws ec2 describe-instances \
  --filters Name=instance-state-name,Values=running \
  --query 'length(Reservations[].Instances[])' \
  --output text

echo ""
echo "Stopped EC2"
echo "==========="

aws ec2 describe-instances \
  --filters Name=instance-state-name,Values=stopped \
  --query 'length(Reservations[].Instances[])' \
  --output text

echo ""
echo "EBS Volumes"
echo "==========="

aws ec2 describe-volumes \
  --query 'length(Volumes[])' \
  --output text
