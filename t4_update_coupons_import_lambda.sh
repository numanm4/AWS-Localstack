#!/bin/bash

# Create or update the Lambda function for coupons_import
aws --endpoint-url=http://localhost:4566 lambda create-function \
    --function-name coupons_import \
    --runtime python3.9 \
    --role arn:aws:iam::000000000000:role/dummy-role \
    --handler coupons_import.lambda_handler \
    --zip-file fileb://C:/Users/Numan/AWS-Localstack/coupons_import.zip \
    || \
    aws --endpoint-url=http://localhost:4566 lambda update-function-code \
        --function-name coupons_import \
        --zip-file fileb://C:/Users/Numan/AWS-Localstack/coupons_import.zip
