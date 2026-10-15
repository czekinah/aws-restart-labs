# Latest lab notes

These notes summarize actual recorded work from October 2026. Account identifiers, private endpoints, and credentials are intentionally omitted. [Canvas verification](verification.md) and [challenge-report status](../challenges/) are tracked separately.

## 175: Auto Scaling under load

The group started with two healthy instances, minimum two and maximum four. A real website stress test raised load; the scaling policy increased capacity from two to three, then three to four. Desired capacity was not manually increased to simulate success.

The useful evidence was the scaling activity alongside healthy targets. Creating an Auto Scaling group alone would not prove that its policy responds to load. Canvas recorded 1/1 on 11 October at 20:36 Manila; the disposable lab was then ended.

## 176: Route 53 failover

Both supplied café websites were tested before configuring the primary health check and paired primary/secondary records. After the primary instance stopped, its health check became unhealthy, the alarm entered ALARM, and the DNS website served the backup instance. The notification was received as well.

The distinction: a saved DNS record is configuration; seeing the backup site after a real failure is verification. Canvas recorded 1/1 on 11 October at 20:57 Manila.

## 177 and 178: Event-driven Lambda

The word-counter challenge connected a private S3 bucket to Lambda and SNS. The separate sales-report activity read sample café data and sent a report. A real test order contained three croissants and two coffees; the received report matched those quantities.

For the report, an initial database timeout was resolved with a same-security-group MySQL rule rather than public database access. A scheduled invocation was verified before restoring the required Monday–Saturday schedule. Lab 178 recorded 1/1 on 11 October at 22:01 Manila.

An email request, a confirmed subscription, a successful invocation, and a received email are different checkpoints. None substitutes for the others.

## 179: Migrate to Amazon RDS

A genuine dump of the local café database was imported into private RDS using certificate-verified TLS. The imported data contained nine products, one order, and nine order items. Updating the application's database endpoint preserved the original order history; a new sample order was independently checked in RDS.

DatabaseConnections was observed returning from zero to one and back to zero. Canvas recorded 1/1 on 12 October at 00:40 Manila.

The migration is not the same exercise as replacing the EC2 server in the instructor's Profile Manager application. That separate persistence test remains in the [instructor tracker](../instructor-exercises/).

## 183–185: Storage, recovery, and notifications

- **183:** Three sample files were synchronized to a versioned bucket. The deleted file's original version was retrieved and matched the saved original by checksum and byte comparison. Snapshot retention was verified separately.
- **184:** The same harmless object was denied anonymous access while private, then successfully retrieved after the specific public-read exercise. Anonymous bucket listing remained denied. This was a deliberately limited classroom exception, not the default storage design.
- **185:** The private sample bucket's notification and restricted test-user exercises were completed. Uploaded and deleted image events were checked against their notifications.

The lesson is to test the exact operation. Successful object access does not imply bucket-listing permission, and restoring a filename is not enough unless the recovered bytes match.

## 189: Right-sizing without breaking the app

The café application was confirmed to use RDS before its decommissioned local database-server package was removed. Its EC2 instance was resized from t3.small to t3.micro. The menu, a new test order, and order history still worked afterward.

The saved classroom calculator comparison was $33.89/month before and $24.30/month after, a projected $9.59/month reduction. This was an October 2026 estimate, not a current price quote or realized billing saving. The calculator also assumed smaller storage; the live volume was not shrunk.

Canvas recorded 1/1 on 13 October at 18:23 Manila.

## 190–192: CloudFormation, failure, and recovery

- **190:** The initial network stack and two updates completed. The final update added the sample instance; the required cleanup reached DELETE_COMPLETE.
- **191:** A misspelled package name, `http` instead of `httpd`, stopped bootstrap before the success signal. The corrected deployment worked. A deliberate security-group change was detected as drift. Later, a nonempty bucket prevented stack deletion; retaining only `MyBucket` let the stack delete while its file stayed unchanged.
- **192:** All eight required resources reached CREATE_COMPLETE. The instance had no public IP and its subnet route table contained only the local route. The attached internet gateway did not by itself make that subnet public.

The failure message points to the symptom; the startup log explains the cause. Cleanup needs its own evidence, especially when a resource must be retained rather than deleted.

## 253 and 316: Final evidence checks

The Bash challenge was rerun for evidence on 13 October: the first run created files 1–25, the next created 26–50, and all 50 files were empty. This is explicitly a later evidence rerun, not a recreation of the original August screenshots.

The SageMaker notebook used 310 sample rows, split 248/31/31. Its XGBoost training job completed and produced a model artifact. It did not create a prediction endpoint. See the [machine-learning entry](machine-learning/).
