# EC2 + private RDS: deployment checklist

**Status: app deployed; CRUD and health checks passed. Server-replacement test and cleanup pending.** Updated 15 October 2026.

This is the remaining application exercise, not a replacement for my completed [private RDS challenge](../../rds-private-mysql/). The aim is to run Profile Manager on EC2, store its rows in RDS, and prove that replacing the web server does not erase the data.

## Source and environment

- [Instructor brief and setup script](https://github.com/jjrs07/restart_batch_29_and_30/tree/306d6a41061a5f4139a4edadf5a0fc5d2161b88b/09-rds-ec2-crud).
- Course sandbox, Oregon (`us-west-2`), which the brief explicitly permits.
- Small Amazon Linux EC2 server and a private, single-AZ MySQL RDS database in the same VPC.
- Website access restricted to my current IP. MySQL access restricted to the app server's security group.
- The sandbox permits `gp2` for RDS, so the database storage setting must follow that restriction rather than the brief's `gp3` example.
- The console rejected MySQL 8.0 because standard support had ended and paid Extended Support was required. The database uses MySQL 8.4.11 with Extended Support disabled. The instructor's app passed bootstrap, health, and CRUD checks with this version.
- Only invented sample records. This HTTP classroom app is not a production service and must not hold personal information.

The instructor's script is the application source. Credentials and the private configured copy stay out of this repository.

## Test record

Results are recorded only after observing them in the app or AWS console. The replacement and cleanup steps remain pending.

| Check | Action | Expected result | Observed result |
|---|---|---|---|
| Bootstrap | Inspect startup output | RDS reachable, Apache running, bootstrap complete | Passed: RDS connected on the first attempt; Apache running; bootstrap complete |
| Health | Open `/health.php` | `status` is `healthy` | Passed: response reported `healthy` |
| Create | Add `Sample Learner`, `learner@example.com` | One new row appears | Passed: profile ID 1 appeared with Student role |
| Read | Reload the page | The same row remains | Passed: ID 1 and its original values remained |
| Update | Edit the sample row's role | Updated role remains after reload | Passed: Guest role remained after reload |
| Unique email | Add another row with `learner@example.com` | Duplicate-email error; no second row | Passed: `That email already exists.` and only one row |
| Delete | Remove the sample learner | Row disappears | Passed: `Profile deleted.` and zero profiles |
| Persistence, before | Add `Persistence Check`, `persistence@example.com` | Record is visible on the first server | Passed: ID 3, Student role, created 2026-10-15 10:54:19, remained after reload |
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

- The scoped network rules are created, and the private, encrypted RDS instance has been provisioned.
- The first EC2 server successfully deployed the instructor's app using the supplied instance profile. Only dummy records were tested.
- Replace the first EC2 server while retaining RDS, then verify the exact saved persistence record on the replacement.
- Capture final evidence and remove the temporary exercise resources before marking the whole exercise complete.

[Back to the instructor exercise tracker](../)
