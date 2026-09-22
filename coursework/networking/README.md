# Networking

![labs](https://img.shields.io/badge/labs-7-0F3D1F?style=flat-square)

Addressing, subnetting, and building a VPC that a web server can actually be reached in.

| # | Lab | Score |
|---|---|---|
| 261 | Public and Private IP addresses | 1/1 |
| 262 | Static and Dynamic IP addresses | 1/1 |
| 263 | Create Subnets in a VPC | 1/1 |
| 264 | Networking resources for a VPC | 1/1 |
| 265 | Internet Protocol Troubleshooting Commands | 1/1 |
| 266 | Troubleshooting a Network Issue | 1/1 |
| 267 | Build your VPC and Launch a Web Server | 1/1 |

## What this track covers

- **Public against private.** A private address is not reachable from the internet no matter what the security group says. Reachability is the route table plus the gateway, then the security group, then the host firewall.
- **Subnets are a routing decision.** A subnet is public because its route table points at an internet gateway, not because of anything in its name.
- **Troubleshooting order.** `ping`, `traceroute`, `netstat`, `dig`. Work from the layer you can prove upward rather than guessing at the top.

> [!IMPORTANT]
> Security groups are stateful and evaluate allow rules only. Network ACLs are stateless and evaluate both allow and deny, in order. When traffic goes out and never comes back, the ACL is usually the one to check.
