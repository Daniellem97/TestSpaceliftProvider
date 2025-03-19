resource "spacelift_stack" "test-stack" {
  branch            = "main"
  name              = "stackname"
  repository        = "tftest"
}
