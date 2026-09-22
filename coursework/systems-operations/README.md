# Systems operations

![labs](https://img.shields.io/badge/labs-1-0F3D1F?style=flat-square)

Driving AWS from the command line instead of the console.

| # | Lab | Score |
|---|---|---|
| 168 | Install and Configure the AWS CLI | 1/1 |

## What this track covers

- **Install and configure.** Download the installer, unzip, install, then `aws configure` for region, output format and credentials.
- **Command shape.** `aws <service> <operation> --parameters`. In `aws ec2 stop-instances --instance-id i-123 --output json`, `ec2` is the service and `stop-instances` is the operation. Everything after is a flag.
- **Why the CLI wins.** The console is fine for one resource. The CLI is scriptable, repeatable and reviewable, which is the whole argument.

> [!NOTE]
> On an EC2 instance, prefer an instance role over a configured access key. A role rotates on its own. A key in `~/.aws/credentials` does not.
