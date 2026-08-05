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

#!/bin/bash

#echo "1 - List EC2"

#echo "2 - Start EC2"

#echo "3 - Stop EC2"

#read OPTION


#aws ec2 start-instances --instance-ids i-xxxxxx
#aws ec2 stop-instances --instance-ids i-xxxxxx
