# Stack "1" in space testnoinheritance-01J82YD2J1E8BRQAR8E1WS3075
resource "spacelift_stack" "stack_1" {
  name       = "stack-1"
  repository = "TestSpaceliftProvider"
  branch     = "main"

  space_id = "testnoinheritance-01J82YD2J1E8BRQAR8E1WS3075"
  terraform_version = "1.3.0"
}


# A policy in space metabasetest-01JPQM3E86ETE2TKCNXVD2MEH1
resource "spacelift_policy" "metabase_policy" {
  name    = "metabase-test-policy"
  type    = "PLAN"
  space_id = "metabasetest-01JPQM3E86ETE2TKCNXVD2MEH1"

  # Minimal PLAN policy example (always allow).
  # Replace with your real policy logic as needed.
  body = <<-REGO
    package spacelift

    default allow = true
  REGO
}

# Attach that policy to the stack
resource "spacelift_policy_attachment" "metabase_policy_to_stack_1" {
  policy_id = spacelift_policy.metabase_policy.id
  stack_id  = spacelift_stack.stack_1.id
}
