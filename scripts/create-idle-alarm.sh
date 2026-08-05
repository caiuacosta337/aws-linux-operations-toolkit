#!/bin/bash

INSTANCE_ID=$1

aws cloudwatch put-metric-alarm \
  --alarm-name "Idle-$INSTANCE_ID" \
  --metric-name CPUUtilization \
  --namespace AWS/EC2 \
  --statistic Average \
  --period 43200 \
  --threshold 5 \
  --comparison-operator LessThanThreshold \
  --evaluation-periods 4 \
  --dimensions Name=InstanceId,Value=$INSTANCE_ID \
  --alarm-actions <SNS_TOPIC_ARN>

