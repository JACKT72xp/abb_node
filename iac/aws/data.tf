data "aws_vpc" "default" {
  default = true
}

data "aws_subnet" "first_subnet" {
  vpc_id = data.aws_vpc.default.id
}

data "aws_security_group" "default_vpc_security_group" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}
