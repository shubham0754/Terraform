#Output VPC_ID
output "vpc_id" {
description = " ID of VPC"
value = aws_vpc.IBM.id
}


