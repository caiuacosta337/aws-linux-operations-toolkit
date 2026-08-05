#!/bin/bash

set -e

ROLE_NAME="EC2SSMRole"
PROFILE_NAME="EC2SSMProfile"
INSTANCE_NAME="aws-linux-toolkit"
INSTANCE_TYPE="t3.micro"

echo "========================================"
echo " AWS Linux Operations Toolkit"
echo " EC2 + SSM Provisioning"
echo "========================================"

echo ""
echo "[1/5] Finding latest Amazon Linux 2023 AMI..."

AMI_ID=$(aws ssm get-parameters \
  --names /aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64 \
  --query 'Parameters[0].Value' \
  --output text)

echo "AMI: $AMI_ID"

echo ""
echo "[2/5] Verifying IAM Role..."

aws iam get-role \
  --role-name "$ROLE_NAME" >/dev/null 2>&1

echo "Role found: $ROLE_NAME"

if ! aws iam get-role \
--role-name "$ROLE_NAME" >/dev/null 2>&1; then
 
echo "ERROR: IAM Role $ROLE_NAME not found"
exit 1
fi

echo ""
echo "[3/5] Verifying Instance Profile..."

aws iam get-instance-profile \
  --instance-profile-name "$PROFILE_NAME" >/dev/null 2>&1

if ! aws iam get-instance-profile \
  --instance-profile-name "$PROFILE_NAME" >/dev/null 2>&1; then

    echo "ERROR: Instance Profile $PROFILE_NAME not found"
    exit 1
fi

echo "Instance Profile found: $PROFILE_NAME"

echo ""
echo "[4/5] Creating EC2..."

INSTANCE_ID=$(aws ec2 run-instances \
  --image-id "$AMI_ID" \
  --instance-type "$INSTANCE_TYPE" \
  --iam-instance-profile Name="$PROFILE_NAME" \
  --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$INSTANCE_NAME}]" \
  --query 'Instances[0].InstanceId' \
  --output text)

echo "Instance created: $INSTANCE_ID"

echo ""
echo "[5/5] Waiting for SSM registration..."

for i in {1..30}
do

    FOUND=$(aws ssm describe-instance-information \
      --query "InstanceInformationList[?InstanceId=='$INSTANCE_ID'].PingStatus" \
      --output text)

    if [ "$FOUND" = "Online" ]; then
        echo ""
        echo "========================================"
        echo "EC2 ready for Session Manager"
        echo "Instance ID: $INSTANCE_ID"
        echo ""
        echo "Connect with:"
        echo "aws ssm start-session --target $INSTANCE_ID"
        echo "========================================"
        exit 0
    fi

    sleep 10

done

echo ""
echo "Instance created, but SSM has not registered yet."
echo "Wait a few minutes and run:"
echo "aws ssm describe-instance-information"

