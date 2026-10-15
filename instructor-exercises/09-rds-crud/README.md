# EC2 + private RDS: deployment checklist

**Status: prepared, not yet deployed or tested.** Updated 15 October 2026.

This is the remaining application exercise, not a replacement for my completed [private RDS challenge](../../rds-private-mysql/). The aim is to run Profile Manager on EC2, store its rows in RDS, and prove that replacing the web server does not erase the data.

## Source and environment

- [Instructor brief and setup script](https://github.com/jjrs07/restart_batch_29_and_30/tree/306d6a41061a5f4139a4edadf5a0fc5d2161b88b/09-rds-ec2-crud).
- Course sandbox, Oregon (`us-west-2`), which the brief explicitly permits.
- Small Amazon Linux EC2 server and a private, single-AZ MySQL RDS database in the same VPC.
- Website access restricted to my current IP. MySQL access restricted to the app server's security group.
- The sandbox permits `gp2` for RDS, so the database storage setting must follow that restriction rather than the brief's `gp3` example.
- Only invented sample records. This HTTP classroom app is not a production service and must not hold personal information.

The instructor's script is the application source. Credentials and the private configured copy stay out of this repository.

## Test record

All results below are pending. Expected results are test criteria, not observed outcomes.

| Check | Action | Expected result | Observed result |
|---|---|---|---|
| Bootstrap | Inspect startup output | RDS reachable, Apache running, bootstrap complete | Pending |
| Health | Open `/health.php` | `status` is `healthy` | Pending |
| Create | Add `Sample Learner`, `learner@example.com` | One new row appears | Pending |
| Read | Reload the page | The same row remains | Pending |
| Update | Edit the sample row's role | Updated role remains after reload | Pending |
| Unique email | Add another row with `learner@example.com` | Duplicate-email error; no second row | Pending |
| Delete | Remove the sample learner | Row disappears after reload | Pending |
| Persistence, before | Add `Persistence Check`, `persistence@example.com` | Record is visible on the first server | Pending |
| Persistence, after | Replace EC2, retaining RDS and its data | The record is visible on the replacement server | Pending |
| Cleanup | Remove only the exercise resources after evidence capture | No temporary app server or database remains | Pending |

## Evidence to keep

1. Private database connectivity settings and the security-group relationship.
2. Successful bootstrap output, excluding credentials.
3. Profile Manager CRUD checks and the health response.
4. The same persistence record before and after EC2 replacement.
5. Resource cleanup confirmation.

Private console screenshots can support the submission. Public notes should record only verified outcomes and sanitized evidence, without keys, passwords, account identifiers, temporary sign-in links, or personal contact information.

## Open dependencies

- Approve the scoped sandbox network rules and supplied instance profile before applying them.
- Create the database credential privately in AWS, then complete the application configuration without publishing it.
- Verify the current sandbox allows the required EC2 and RDS operations.
- Complete the tests above before changing this page's status to complete.

[Back to the instructor exercise tracker](../)
