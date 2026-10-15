# Instructor exercise tracker

Reference: [AWS re/Start Batch 29 and 30](https://github.com/jjrs07/restart_batch_29_and_30), reviewed at commit `306d6a4` on 15 October 2026.

The instructor repository contains nine exercises. This table links the work already in this portfolio and keeps the remaining checkpoints visible. **It does not convert a related Canvas lab into completion of a different exercise.**

| # | Exercise | Current portfolio evidence | Status / next checkpoint |
|---|---|---|---|
| 01 | On-prem vs cloud website | Related EC2 work, but no paired deployment of this exact app | Pending: run identical app in local Linux and EC2; capture both environment outputs |
| 02 | S3 console walkthrough | Canvas storage, version recovery, and access-control work | Partial: verify this walkthrough's KMS, HTTPS-only policy, presigned URL, lifecycle, and cleanup checkpoints |
| 03 | Linux file-system navigation | [Ten path challenges](../linux-paths/) and transcript | Existing exercise work documented |
| 04 | Linux log management | [Log sizing, scheduling, retention](../linux-log-management/) and transcript | Existing exercise work documented; preserve the observed rotation failure |
| 05 | curl vs wget | [Download comparison](../curl-vs-wget/) and transcript | Adapted exercise documented: allowed archive used after AWS-installer download was blocked |
| 06 | MySQL conditional search | [Sixteen queries and results](../sql-conditional-search/) | Query work documented; not a claim of a newly verified EC2 bootstrap |
| 07 | ACM, ALB, and HTTPS | Related load-balancing and DNS labs | Pending: allowed sandbox services, controlled public hostname, issued certificate, HTTPS and redirect evidence |
| 08 | Multiple-table queries | [Fifteen queries and results](../sql-multi-table-joins/) | Existing query work documented |
| 09 | EC2 + RDS CRUD app | [Private RDS](../rds-private-mysql/) and Canvas migration results | Partial: run Profile Manager CRUD checks and prove persistence after EC2 replacement |

## Deployment evidence still needed

### 01: Same app, two environments

- [ ] Suitable local Linux environment confirmed; no system-wide changes on the personal laptop assumed.
- [ ] Apache/PHP deployment in the local Linux environment returns `onprem`.
- [ ] The same application files deployed to sandbox EC2 return `cloud`.
- [ ] Genuine paired website/API evidence saved.
- [ ] Disposable cloud resources cleaned up and cleanup recorded.

### 02: S3 walkthrough

- [ ] Reconcile bucket, object-key, version-recovery, and encryption evidence with the exact brief.
- [ ] Verify SSE-KMS and its permissions in the allowed sandbox.
- [ ] Test the HTTPS-only bucket policy without exposing the bucket publicly.
- [ ] Test a short-lived presigned object URL; never publish the signed URL.
- [ ] Configure the required lifecycle rule and inspect its scope.
- [ ] Capture results before approved cleanup of versions, markers, and lab resources.

### 07: ACM + ALB + HTTPS

- [ ] Sandbox supports EC2, ELB, ACM, and the required DNS workflow.
- [ ] A public domain/subdomain and permission to edit its DNS are available.
- [ ] Certificate is **Issued** in the same region as the ALB.
- [ ] Custom hostname loads over HTTPS without a certificate warning.
- [ ] HTTPS listener forwards to healthy targets; HTTP redirects to HTTPS.
- [ ] Certificate, website, listener, and validation-CNAME evidence captured.
- [ ] Short TLS-termination explanation and actual troubleshooting reflection written.
- [ ] Resources cleaned up after evidence capture.

An EC2 hostname, an ALB-generated hostname, or a private domain is not a substitute for a public hostname whose DNS can be controlled. Do not bypass restrictions in the training account.

### 09: Persistent CRUD application

- [ ] Private RDS and EC2 are in the same VPC; database access is limited to the application security group.
- [ ] Profile Manager bootstrap succeeds; credentials stay outside the repository and public web root.
- [ ] Create, read, update, delete, and duplicate-email checks pass with sample data.
- [ ] Health endpoint confirms the database round trip.
- [ ] A sample row survives replacement of the original EC2 instance while RDS remains intact.
- [ ] Evidence is captured before approved cleanup.

## Working rules

Use the course sandbox, not a personal paid account. Check the account, region, service restrictions, and resource scope before deployment. Keep instructor materials attributed. A checklist is a plan until its corresponding result has been observed.
