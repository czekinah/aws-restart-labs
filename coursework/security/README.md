# Security

![labs](https://img.shields.io/badge/labs-6-0F3D1F?style=flat-square)

Hardening the network, then the host, then the data, then watching all three.

| # | Lab | Score |
|---|---|---|
| 276 | Network Hardening | 1/1 |
| 277 | Systems Hardening | 1/1 |
| 278 | Data Protection | 1/1 |
| 279 | Introduction to Identity and Access Management (IAM) | 1/1 |
| 280 | Firewall Malware | 1/1 |
| 281 | Monitor an EC2 Instance | 1/1 |

## What this track covers

- **Least privilege, written down.** An IAM policy is a document, so the review question is which statement grants the thing you did not intend, not whether it works.
- **Identity over credentials.** A role is assumed and expires. An access key sits in a file until someone commits it. Roles are the default for anything running on AWS.
- **Reduce the surface.** Close the ports nothing uses, remove the packages nothing needs, patch what remains.
- **Monitoring is part of security.** An instance you cannot see metrics for is one you cannot tell is compromised.

> [!WARNING]
> The pattern behind every lab here: identity, then network, then host, then data. Skipping straight to the firewall rule is how an over-permissive policy survives the review.
