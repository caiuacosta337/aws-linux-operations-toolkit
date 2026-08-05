#!/bin/bash

select_instance() {

    echo ""
    echo "Available EC2 Instances"
    echo "======================="
    echo ""

    aws ec2 describe-instances \
      --query "Reservations[*].Instances[*].[Tags[?Key=='Name'].Value|[0],InstanceId,State.Name]" \
      --output table

    echo ""
    read -p "Enter Instance ID: " INSTANCE_ID

    echo "$INSTANCE_ID"
}
