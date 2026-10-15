# EC2 + private RDS: verified results

**Status: complete. App, CRUD, health, persistence, and resource cleanup verified.** Updated 15 October 2026.

This application exercise is separate from my completed [private RDS challenge](../../rds-private-mysql/). I ran Profile Manager on EC2, stored its rows in RDS, and verified that replacing the web server did not erase the data.

## Source and environment

- [Instructor brief and setup script](https://github.com/jjrs07/restart_batch_29_and_30/tree/306d6a41061a5f4139a4edadf5a0fc5d2161b88b/09-rds-ec2-crud).
- Course sandbox, Oregon (`us-west-2`), which the brief explicitly permits.
- Small Amazon Linux EC2 server and a private, single-AZ MySQL RDS database in the same VPC.
- During testing, website access was restricted to my current IP. MySQL access was restricted to the app server's security group.
- The sandbox permits `gp2` for RDS, so the database storage setting must follow that restriction rather than the brief's `gp3` example.
- The console rejected MySQL 8.0 because standard support had ended and paid Extended Support was required. The database used MySQL 8.4.11 with Extended Support disabled. The instructor's app passed bootstrap, health, and CRUD checks with this version.
- Only invented sample records. This HTTP classroom app is not a production service and must not hold personal information.

The instructor's script is the application source. Credentials stayed out of this repository. The temporary configuration held in browser memory was cleared after cleanup; no credential-bearing local file was created.

## Test record

All results below were observed in the app or AWS console before being recorded.

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
| Persistence, after | Replace EC2, retaining RDS and its data | The record is visible on the replacement server | Passed: original EC2 terminated; replacement showed the same ID 3, name, email, Student role, and original creation time. Replacement health endpoint also reported `healthy` |
| Replacement startup | Inspect diagnostics and system log | Healthy instance and completed setup | Passed: system, instance, and attached-EBS checks passed; RDS reachable on first attempt; Apache running and bootstrap complete |
| Cleanup | Remove only the exercise resources after evidence capture | No temporary app server or database remains | Passed: both EC2 instances terminated; no EC2 volumes remain; RDS deletion confirmed; both exercise security groups removed; default group preserved |

## Evidence recorded

1. Private database connectivity settings and the security-group relationship.
2. Successful bootstrap output, excluding credentials.
3. Profile Manager CRUD checks and the health response.
4. The same persistence record before and after EC2 replacement.
5. Resource cleanup confirmation.

Screenshots of the app tests, before-and-after persistence record, replacement checks, and cleanup are saved privately. This public record excludes passwords, keys, account identifiers, temporary sign-in links, and personal contact information.

## Cleanup completed

- Terminated the original web server for the persistence test, then terminated its replacement after evidence capture.
- Verified that no EC2 root volumes remained in the exercise region.
- Deleted the disposable RDS database without a final snapshot or retained automated backups, as specified by the classroom cleanup instructions. The dummy data is no longer recoverable from that database.
- Deleted the database security group, then the application security group. The default security group and shared sandbox network were left unchanged.
- Retained screenshots and documentation. The temporary app addresses are no longer live.

## What I verified

The web server is disposable, but the data is not stored on its root disk. A new EC2 hostname and public address served the original profile from the same RDS database. The unchanged record ID and creation time made this a persistence check, not just another successful app launch.

### Self-check

1. **Why reference the EC2 security group?** Only instances carrying that group can connect on MySQL port 3306. Replacing the web server does not require allowing a new public IP at the database.
2. **What happens to rows when EC2 is terminated?** They remain in RDS while the database is retained. I verified this with the persistence profile.
3. **Why wait before creating the schema?** RDS needs to finish becoming available and accept authenticated connections before SQL initialization can succeed.
4. **Which group allows EC2-to-RDS traffic?** The database security group's inbound rule allows port 3306 from the app security group; outbound traffic and network routing must also permit the connection.
5. **How can HTTP and database failures be separated?** An unreachable page calls for checking the app's HTTP rule, public address, and Apache. A loaded app with a failed health response calls for checking RDS availability, endpoint, credentials, and database network rules.

[Back to the instructor exercise tracker](../)
