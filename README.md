# AWS Linux Operations Toolkit

A cloud operations portfolio project focused on automating Linux instance administration on AWS using Bash, AWS CLI, Amazon EC2, IAM and AWS Systems Manager.

## Purpose

This project simulates common day-to-day tasks performed by Cloud, DevOps and Infrastructure Engineers, including EC2 provisioning, secure access through Systems Manager, instance lifecycle management, infrastructure monitoring, idle detection and cost visibility.

## Scripts

| Script | Purpose |
|----------|----------|
| `create-ec2.sh` | Creates an Amazon Linux EC2 instance configured for AWS Systems Manager access |
| `connect-ssm.sh` | Connects to an EC2 instance using AWS Systems Manager Session Manager |
| `start-instance.sh` | Starts a selected EC2 instance |
| `stop-ec2.sh` | Stops a selected EC2 instance |
| `monitor.sh` | Displays infrastructure inventory and operational status |
| `idle-check.sh` | Checks whether an EC2 instance appears idle based on CPU usage |
| `create-idle-alarm.sh` | Creates a CloudWatch alarm for idle EC2 detection |
| `cost-report.sh` | Displays AWS cost and billing information |
| `backup.sh` | Creates a backup of selected project resources |
| `cleanup.sh` | Terminates selected EC2 instances after confirmation |
| `system-report.sh` | Displays Linux system information |
```

## Key Highlights

- Provision EC2 instances using AWS CLI
- Connect to Linux instances without SSH using AWS Systems Manager Session Manager
- Start, stop and terminate EC2 instances through automation
- Monitor EC2, SSM, EBS and Security Group resources
- Generate basic AWS cost and billing visibility
- Detect idle resources for cost optimization
- Organize scripts for reusable cloud operations workflows
