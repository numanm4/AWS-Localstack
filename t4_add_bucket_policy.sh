#!/bin/bash

# Add bucket policy to require MFA for deletions
aws --endpoint-url=http://localhost:4566 s3api put-bucket-policy --bucket coupons --policy '{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "RequireMFAForDeletion",
            "Effect": "Deny",
            "Principal": "*",
            "Action": "s3:DeleteObject",
            "Resource": "arn:aws:s3:::coupons/*",
            "Condition": {
                "StringNotEquals": {
                    "aws:MultiFactorAuthPresent": "true"
                }
            }
        }
    ]
}'
