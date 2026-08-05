# Architecture

```text
User
 |
 | AWS CloudShell
 v
AWS CLI
 |
 +--> EC2
 |
 +--> IAM Role / Instance Profile
 |
 +--> AWS Systems Manager Session Manager
 |
 +--> CloudWatch / Cost Explorer
``
