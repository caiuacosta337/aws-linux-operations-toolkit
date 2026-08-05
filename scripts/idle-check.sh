#!/bin/bash

CPU_THRESHOLD=5
INSTANCE_ID=$1

AVG_CPU=$(aws cloudwatch get-metric-statistics \
  --namespace AWS/EC2 \
  --metric-name CPUUtilization \
  --dimensions Name=InstanceId,Value=$INSTANCE_ID \
  --start-time $(date -u -d "4 hours ago" +%FT%TZ) \
  --end-time $(date -u +%FT%TZ) \
  --period 14400 \
  --statistics Average \
  --query 'Datapoints[0].Average' \
  --output text)

echo "Average CPU: $AVG_CPU %"

if (( $(echo "$AVG_CPU < $CPU_THRESHOLD" | bc -l) )); then
    echo "Instance appears idle."
else
    echo "Instance is active."
fi
