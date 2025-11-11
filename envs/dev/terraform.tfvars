vpc_cidr = "10.0.0.0/16"

public_subnets = {
  "0" = "10.0.1.0/24"
  "1" = "10.0.2.0/24"
}

private_subnets = {
  "0" = "10.0.10.0/24"
  "1" = "10.0.20.0/24"
}

image_id        = "" # leave blank to use data source in main.tf or set AMI id
key_name        = "Abbie-key"
user_data_file  = "../../install_nginx.sh"
