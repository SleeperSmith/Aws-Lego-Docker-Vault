backend "dynamodb" {
	table = "{{ddb-table}}"
	region = "{{aws-region}}"
	advertise_addr = "https://{{elb-address}}/"
	recovery_mode=1
}

listener "tcp" {
	address = "0.0.0.0:80"
	tls_disable = 1
}
