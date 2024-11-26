import json
import boto3

s3 = boto3.client("s3")

def coupons_import(event, context):
    bucket_name = "coupons"
    body = json.loads(event["body"])
    coupon_id = body["coupon_id"]
    content = body["content"]

    # Save file in S3
    file_name = f"{coupon_id}.json"
    s3.put_object(Bucket=bucket_name, Key=file_name, Body=json.dumps(content))

    return {
        "statusCode": 200,
        "body": json.dumps({"status": "success"})
    }
