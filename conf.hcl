backend "dynamodb" {
	table = "{{ddb-table}}"
	region = "{{aws-region}}"
	advertise_addr = "https://{{elb-address}}/"
}

listener "tcp" {
	address = "0.0.0.0:80"
	tls_disable = 1
}
