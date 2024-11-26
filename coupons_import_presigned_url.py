import boto3
import json

s3 = boto3.client("s3")

def lambda_handler(event, context):
    bucket_name = "coupons"
    body = json.loads(event["body"])
    file_name = body["filename"]

    # Generate a presigned URL
    presigned_url = s3.generate_presigned_url(
        "put_object",
        Params={"Bucket": bucket_name, "Key": file_name},
        ExpiresIn=3600,
    )

    return {
        "statusCode": 200,
        "body": json.dumps({"url": presigned_url, "status": "success"})
    }
