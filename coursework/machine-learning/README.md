# Machine learning

![labs](https://img.shields.io/badge/labs-1-0F3D1F?style=flat-square)

| # | Lab | Score |
|---|---|---|
| 316 | SageMaker: Training a machine-learning model | 1/1 |

## What I completed

On 13 October 2026, the supplied notebook was run with the `conda_python3` environment. The dataset contained 310 rows, split into 248 training, 31 validation, and 31 test rows. The prepared files were uploaded to the lab's private S3 bucket.

The XGBoost training job reached **Completed**, and its `model.tar.gz` output was verified. Canvas recorded **1/1** at 22:47 Manila. The notebook and genuine training-result captures were saved before ending the disposable lab.

## The boundary that matters

A completed training job is not a deployed prediction service. No prediction endpoint was created, and this entry does not claim production accuracy or a production deployment. The useful checkpoint is the successful training run plus its actual model artifact.

The original notebook outputs contain training-account identifiers, so they remain in the private evidence archive rather than being copied unreviewed into this public repository.
