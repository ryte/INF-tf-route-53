resource "aws_route53_record" "a_records" {
  count   = length(var.a_records)
  name    = element(keys(var.a_records), count.index)
  ttl     = var.ttl
  type    = "A"
  zone_id = var.zone_id

  # TF-UPGRADE-TODO: In Terraform v0.10 and earlier, it was sometimes necessary to
  # force an interpolation expression to be interpreted as a list by wrapping it
  # in an extra set of list brackets. That form was supported for compatibility in
  # v0.11, but is no longer supported in Terraform v0.12.
  #
  # If the expression in the following list itself returns a list, remove the
  # brackets to avoid interpretation as a list of lists. If the expression
  # returns a single list item then leave it as-is and remove this TODO comment.
  records = [element(values(var.a_records), count.index)]
}

resource "aws_route53_record" "a_alias_records" {
  count   = length(var.a_alias_records)
  name    = element(keys(var.a_alias_records), count.index)
  type    = "A"
  zone_id = var.zone_id

  alias {
    name = element(
      split(",", element(values(var.a_alias_records), count.index)),
      0,
    )
    zone_id = element(
      split(",", element(values(var.a_alias_records), count.index)),
      1,
    )
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "cname_records" {
  count   = length(var.cname_records)
  name    = element(keys(var.cname_records), count.index)
  ttl     = var.ttl
  type    = "CNAME"
  zone_id = var.zone_id

  # TF-UPGRADE-TODO: In Terraform v0.10 and earlier, it was sometimes necessary to
  # force an interpolation expression to be interpreted as a list by wrapping it
  # in an extra set of list brackets. That form was supported for compatibility in
  # v0.11, but is no longer supported in Terraform v0.12.
  #
  # If the expression in the following list itself returns a list, remove the
  # brackets to avoid interpretation as a list of lists. If the expression
  # returns a single list item then leave it as-is and remove this TODO comment.
  records = [element(values(var.cname_records), count.index)]
}

resource "aws_route53_record" "txt_records" {
  count   = length(var.txt_records)
  name    = element(keys(var.txt_records), count.index)
  ttl     = var.ttl
  type    = "TXT"
  zone_id = var.zone_id

  # TF-UPGRADE-TODO: In Terraform v0.10 and earlier, it was sometimes necessary to
  # force an interpolation expression to be interpreted as a list by wrapping it
  # in an extra set of list brackets. That form was supported for compatibility in
  # v0.11, but is no longer supported in Terraform v0.12.
  #
  # If the expression in the following list itself returns a list, remove the
  # brackets to avoid interpretation as a list of lists. If the expression
  # returns a single list item then leave it as-is and remove this TODO comment.
  records = [element(values(var.txt_records), count.index)]
}

resource "aws_route53_record" "txt_record_root" {
  count   = length(var.txt_record_root) > 1 ? 1 : 0
  name    = ""
  ttl     = var.ttl
  type    = "TXT"
  zone_id = var.zone_id

  records = var.txt_record_root
}

resource "aws_route53_record" "mx_records" {
  count   = length(var.mx_records) > 1 ? 1 : 0
  name    = ""
  ttl     = var.ttl
  type    = "MX"
  zone_id = var.zone_id

  records = var.mx_records
}

resource "aws_route53_record" "srv_records" {
  count   = length(var.srv_records)
  name    = element(keys(var.srv_records), count.index)
  ttl     = var.ttl
  type    = "SRV"
  zone_id = var.zone_id

  # TF-UPGRADE-TODO: In Terraform v0.10 and earlier, it was sometimes necessary to
  # force an interpolation expression to be interpreted as a list by wrapping it
  # in an extra set of list brackets. That form was supported for compatibility in
  # v0.11, but is no longer supported in Terraform v0.12.
  #
  # If the expression in the following list itself returns a list, remove the
  # brackets to avoid interpretation as a list of lists. If the expression
  # returns a single list item then leave it as-is and remove this TODO comment.
  records = [element(values(var.srv_records), count.index)]
}

