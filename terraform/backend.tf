terraform {
  backend "s3" {
    # ================== CHANGE THESE VALUES ==================
    bucket         = ""      # ← Create this S3 bucket manually first
    key            = "fullstack-prod/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = ""                    # ← Create this DynamoDB table (partition key = LockID)
    # ========================================================
  }
}