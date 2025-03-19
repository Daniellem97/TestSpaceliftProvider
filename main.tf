resource "spacelift_stack" "test-stack" {
  branch            = "master"
  name              = "stackname"
  repository        = "tftest"
}
