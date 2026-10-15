# Challenge results

**Czekinah Tolentino · PHMAN29**

One challenge, one PDF. Eleven individual reports were prepared and checked by 13 October 2026. This public index summarizes the results; the original PDFs and screenshots remain in the private submission archive. **Instructor-thread upload and approval are not verified here.**

| Lab | Challenge | Canvas | Individual PDF |
|---|---|---|---|
| 141 | Python Exercise | 1/1 | Prepared |
| 162 | Build and Access an RDS Server | 1/1 | Prepared |
| 172 | EC2 Instance Exercise | 1/1 | Prepared |
| 177 | AWS Lambda Exercise | 1/1 | Prepared |
| 183 | Storage recovery challenge | 1/1 | Prepared |
| 184 | S3 Exercise | 1/1 | Prepared |
| 187 | CloudTrail investigation challenge | 1/1 | Prepared |
| 188 | Tagging challenge | 1/1 | Prepared |
| 191 | CloudFormation troubleshooting challenge | 1/1 | Prepared |
| 192 | CloudFormation Challenge | 1/1 | Prepared |
| 253 | Bash Shell Scripting | 1/1 | Prepared |

## 141: Python Exercise

The individual report contains the saved Python source, execution results, and Canvas completion evidence. The historical submission was retained; later documentation was not presented as a new original submission.

## 162: Build and Access an RDS Server

Private MySQL was reached from the supplied Linux server. Seven SQL steps created and populated two tables, then joined the five matching rows. All seven required query screenshots were captured in a genuine evidence rerun. See the [RDS deep dive](../rds-private-mysql/).

## 172: EC2 Instance Exercise

The individual report contains the EC2 exercise evidence and required screenshots. This challenge's completion is separate from the instructor's two-environment website comparison.

## 177: AWS Lambda Exercise

Text uploads to a private S3 bucket invoked the word-counter function, which sent results through SNS. The report includes the function and received-message evidence. Local tests alone were not treated as proof of cloud execution.

## 183: Storage recovery

Three sample files were synchronized. A deleted object's earlier version was restored and checked against the original bytes before resynchronizing. The report covers this embedded storage challenge, while the rest of the lab was verified separately.

## 184: S3 Exercise

The evidence follows the same object from private AccessDenied to the permitted public-read test. Anonymous bucket listing remained denied. The report preserves the actual before-and-after results.

## 187: CloudTrail investigation

The supplied simulated incident was investigated before the attacker accounts were removed. The report captures the investigation and recovery; it does not publish credentials, private incident identifiers, or raw account logs.

## 188: Tagging challenge

The specified two development instances had their Environment tags removed, then the challenge targeted those two instances. The other seven resources were preserved. Scope verification mattered because an overly broad termination command would have changed unrelated resources.

## 191: CloudFormation troubleshooting

The nonempty `MyBucket` caused DELETE_FAILED. Retaining that logical resource let the stack reach DELETE_COMPLETE; the bucket showed DELETE_SKIPPED and its file's size, checksum, and modification time stayed unchanged.

## 192: CloudFormation Challenge

The stack created its VPC, attached internet gateway, private subnet, security group, and t3.micro instance with the required supporting resources. All eight resources completed. The instance had no public address or internet route. The required broad SSH rule was confined to this unreachable training setup, not proposed as a production rule.

## 253: Bash Shell Scripting

The October 13 evidence rerun created sequential batches 1–25 and 26–50. The script detected the next number rather than hardcoding each batch, and 50 empty files were verified. The PDF labels the rerun date separately from the original August completion.

## Separate activity

The Acceptable Use Policy activity has its own PDF and is not combined with a challenge report or counted as an extra scored lab.
