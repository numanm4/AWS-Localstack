#!/bin/bash

# Create the S3 bucket with private ACL in LocalStack, matching the region
aws --endpoint-url=http://localhost:4566 s3api create-bucket \
    --bucket coupons \
    --acl private \
    --create-bucket-configuration LocationConstraint=us-west-2
