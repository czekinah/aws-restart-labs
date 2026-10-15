# Systems operations

![labs](https://img.shields.io/badge/labs-19-0F3D1F?style=flat-square)

Driving AWS from the CLI and console, then checking that the system actually works. This portfolio track groups compute, storage, serverless, and deployment operations.

| # | Lab | Score |
|---|---|---|
| 168 | Install and Configure the AWS CLI | 1/1 |
| 169 | Using AWS Systems Manager | 1/1 |
| 170 | Create a Website on S3 | 1/1 |
| 171 | Creating Amazon EC2 Instances | 1/1 |
| 172 | EC2 Instance Exercise | 1/1 |
| 173 | Troubleshoot Create Instance | 1/1 |
| 174 | Scale and Load Balance your Architecture | 1/1 |
| 175 | Using Auto Scaling in AWS (Linux) | 1/1 |
| 177 | [Challenge] AWS Lambda Exercise | 1/1 |
| 178 | Working with AWS Lambda | 1/1 |
| 182 | Working with Amazon EBS | 1/1 |
| 183 | Managing Storage | 1/1 |
| 184 | [Challenge] S3 Exercise | 1/1 |
| 185 | Work with Amazon S3 | 1/1 |
| 188 | Managing Resources with Tagging | 1/1 |
| 189 | Optimize Utilization | 1/1 |
| 190 | Automating Deployments with AWS CloudFormation | 1/1 |
| 191 | Troubleshooting AWS CloudFormation Deployments | 1/1 |
| 192 | [Challenge] CloudFormation | 1/1 |

## What this track covers

- **Install and configure.** Download the installer, unzip, install, then `aws configure` for region, output format and credentials.
- **Command shape.** `aws <service> <operation> --parameters`. In `aws ec2 stop-instances --instance-id i-123 --output json`, `ec2` is the service and `stop-instances` is the operation. Everything after is a flag.
- **Why the CLI wins.** The console is fine for one resource. The CLI is scriptable, repeatable and reviewable, which is the whole argument.

> [!NOTE]
> On an EC2 instance, prefer an instance role over a configured access key. A role rotates on its own. A key in `~/.aws/credentials` does not.

## Results worth opening

- [Auto Scaling, Lambda, storage, optimization, and deployment notes](../latest-lab-notes.md)
- [Separate challenge outcomes](../../challenges/)
- [Instructor exercise gaps](../../instructor-exercises/), including HTTPS and the EC2-replacement persistence test
