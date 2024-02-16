resource "random_string" "rand_string" {
  length  = var.length
  special = false
}
