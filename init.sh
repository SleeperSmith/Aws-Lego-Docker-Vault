#!/bin/bash

EC2_AVAIL_ZONE=`curl -s http://169.254.169.254/latest/meta-data/placement/availability-zone`
EC2_REGION="`echo \"$EC2_AVAIL_ZONE\" | sed -e 's:\([0-9][0-9]*\)[a-z]*\$:\\1:'`"
PVT_IP=`curl -s http://169.254.169.254/latest/meta-data/local-ipv4`

sed -i "s/{{aws-region}}/$EC2_REGION/g" ./conf.hcl
sed -i "s/{{elb-address}}/$ELB_ADDRESS/g" ./conf.hcl
sed -i "s/{{ddb-table}}/$DDB_TABLE/g" ./conf.hcl

./vault server --config conf.hcl
