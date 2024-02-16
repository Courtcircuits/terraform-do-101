# Déclarer le provider et les "resources" ici
provider "random" {

}


resource "random_integer" "random_int_0_1000" {
  min = 0
  max = 1000
}

output "random_int_0_1000" {
  value = random_integer.random_int_0_1000.result
}
