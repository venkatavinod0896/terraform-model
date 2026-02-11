resource "aws_instance" "this" {
  for_each = var.instances

  ami                    = var.ami
  instance_type          = each.value
  subnet_id              = var.subnet_ids[0]
  vpc_security_group_ids = var.sg_ids

  tags = merge(var.common_tags, {
    Name = "${var.env}-${each.key}"
  })
}
