# Create REST API
aws --endpoint-url=http://localhost:4566 apigateway create-rest-api --name "CouponsImportAPI"

# Create resources and methods (adjust as needed)
aws --endpoint-url=http://localhost:4566 apigateway create-resource --rest-api-id YOUR_API_ID --parent-id YOUR_PARENT_ID --path-part "coupons"
aws --endpoint-url=http://localhost:4566 apigateway create-resource --rest-api-id YOUR_API_ID --parent-id YOUR_COUPONS_ID --path-part "import"
aws --endpoint-url=http://localhost:4566 apigateway put-method --rest-api-id YOUR_API_ID --resource-id YOUR_IMPORT_ID --http-method POST --authorization-type NONE
aws --endpoint-url=http://localhost:4566 apigateway put-integration --rest-api-id YOUR_API_ID --resource-id YOUR_IMPORT_ID --http-method POST \
    --type AWS_PROXY --integration-http-method POST --uri arn:aws:apigateway:local:lambda:path/2015-03-31/functions/arn:aws:lambda:local:function:coupons_import/invocations
