# AWS Linux Operations Toolkit

A portfolio project focused on Linux administration and AWS automation using Bash, AWS CLI, EC2 and AWS Systems Manager.

## Overview

This project demonstrates how to manage Amazon EC2 instances without SSH by using AWS Systems Manager Session Manager (SSM).

The goal is to automate common Linux administration tasks through reusable Bash scripts.

## Implemented Features

- EC2 provisioning through AWS CLI
- AWS Systems Manager (SSM) integration
- SSH-less administration
- Instance lifecycle management
- System information reporting
- Bash automation scripts

## Technologies

- Linux
- Bash
- AWS CLI
- Amazon EC2
- AWS IAM
- AWS Systems Manager
- GitHub

## Project Structure

```text
aws-linux-operations-toolkit/
│
├── scripts/
│   ├── create-ec2.sh
│   ├── connect-ssm.sh
│   ├── stop-ec2.sh
│   ├── system-report.sh
│   ├── start-instance.sh
│   ├── monitor.sh
│   ├── backup.sh
│   └── cleanup.sh
│
├── docs/
│
├── screenshots/
│
└── README.md
```

## Current Scripts

### create-ec2.sh

Creates an Amazon Linux EC2 instance configured for Systems Manager access.

### connect-ssm.sh

Lists available SSM-managed instances and connects to a selected EC2 instance.

### stop-ec2.sh

Stops an EC2 instance.

### system-report.sh

Displays:

- Hostname
- Kernel version
- Uptime
- Memory usage
- Disk usage
- Logged users

## Security Design

This project follows a modern cloud administration approach:

- No SSH keys required
- No inbound SSH rule required
- No exposed port 22
- IAM Role-based access
- AWS Systems Manager Session Manager

## Roadmap

Planned improvements:

- Start instance automation
- EC2 monitoring
- Docker installation via SSM
- S3 backup automation
- CloudWatch integration
- GitHub Actions pipeline

## Lessons Learned

- IAM Roles and Instance Profiles
- AWS Systems Manager Session Manager
- EC2 provisioning through AWS CLI
- Bash automation for cloud operations

## Author

Caiuã Pereira da Costa

Senior Analyst | Cloud & Infrastructure | Linux | AWS | DevOps
