variable "env" {}
variable "ami" {}
variable "instances" {
  type = map(string)
}
variable "subnet_ids" {
  type = list(string)
}
variable "sg_ids" {
  type = list(string)
}
variable "common_tags" {
  type = map(string)
}
