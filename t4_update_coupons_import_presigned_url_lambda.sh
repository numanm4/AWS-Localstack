#!/bin/bash

# Create or update the Lambda function for coupons_import_presigned_url
aws --endpoint-url=http://localhost:4566 lambda create-function \
    --function-name coupons_import_presigned_url \
    --runtime python3.9 \
    --role arn:aws:iam::000000000000:role/dummy-role \
    --handler coupons_import_presigned_url.lambda_handler \
    --zip-file fileb://C:/Users/Numan/AWS-Localstack/coupons_import_presigned_url.zip \
    || \
    aws --endpoint-url=http://localhost:4566 lambda update-function-code \
        --function-name coupons_import_presigned_url \
        --zip-file fileb://C:/Users/Numan/AWS-Localstack/coupons_import_presigned_url.zip
