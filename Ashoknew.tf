 module "s3_replication" {
providers = {
  module "kms" {
    count               = (var.kms == null && var.sse_algorithm == "aws:kms") ? 1 : 0
    source              = "../kms"
    short_prefix        = "${var.short_prefix}-s3"
    long_prefix         = "${var.long_prefix}-s3"
    administrator_roles = var.administrator_roles
    read_roles          = concat(var.read_roles, local.write_roles)
    tags                = var.tags
    description         = var.long_prefix
   }
}