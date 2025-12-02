run "verify_aws_identity" {
  command = plan

  assert {
    condition     = data.aws_caller_identity.current.account_id != ""
    error_message = "AWS caller identity should return an account ID"
  }

  assert {
    condition     = can(regex("arn:aws", data.aws_caller_identity.current.arn))
    error_message = "Caller ARN should be a valid AWS ARN"
  }
}
