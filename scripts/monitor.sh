#!/bin/bash

echo ""
echo "================================================"
echo " Linux Cloud Admin - Infrastructure Dashboard"
echo "================================================"

echo ""
echo "AWS Account"
echo "==========="

aws sts get-caller-identity \
    --query '[Account,Arn]' \
    --output table

echo ""
echo "EC2 Inventory"
echo "============="

aws ec2 describe-instances \
    --query "Reservations[*].Instances[*].[Tags[?Key=='Name'].Value|[0],InstanceId,State.Name,InstanceType,PrivateIpAddress,PublicIpAddress,LaunchTime]" \
    --output table

echo ""
echo "SSM Managed Instances"
echo "====================="

aws ssm describe-instance-information \
    --query "InstanceInformationList[*].[InstanceId,PingStatus,PlatformName,PlatformVersion,LastPingDateTime]" \
    --output table

echo ""
echo "EBS Volumes"
echo "==========="

aws ec2 describe-volumes \
    --query "Volumes[*].[VolumeId,Size,State,VolumeType]" \
    --output table

echo ""
echo "Security Groups"
echo "==============="

aws ec2 describe-security-groups \
    --query "SecurityGroups[*].[GroupName,GroupId]" \
    --output table

echo ""
echo "Running Instances"
echo "================="

aws ec2 describe-instances \
    --filters "Name=instance-state-name,Values=running" \
    --query "length(Reservations[].Instances[])" \
    --output text

echo ""
echo "Stopped Instances"
echo "================="

aws ec2 describe-instances \
    --filters "Name=instance-state-name,Values=stopped" \
    --query "length(Reservations[].Instances[])" \
    --output text

echo ""
echo "Monitoring completed."
