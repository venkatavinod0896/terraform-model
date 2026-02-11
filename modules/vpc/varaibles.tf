variable "env" {}
variable "vpc_cidr" {}
variable "public_subnets" {
  type = map(string)
}
variable "common_tags" {
  type = map(string)
}
