output "epic_book_public_ip" {
  value = module.compute.epic_book_public_ip
}

output "public_subnet_id" {
  value = module.network.public_subnet_id
}

output "nsg_id" {
  value = module.network.nsg_id
}

output "mysql_fqdn" {
  value = module.database.mysql_fqdn
}
