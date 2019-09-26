resource "aws_route53_record" "a_records" {
  for_each = var.a_records
  name     = each.value.name
  ttl      = var.ttl
  type     = "A"
  zone_id  = var.zone_id

  records  = each.value.records
}

resource "aws_route53_record" "a_alias_records" {
  for_each = var.a_alias_records
  name     = each.value.name
  type     = "A"
  zone_id  = var.zone_id

  alias {
    name                   = each.value.record
    zone_id                = each.value.zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "cname_records" {
  for_each = var.cname_records
  name     = each.value.name
  ttl      = var.ttl
  type     = "CNAME"
  zone_id  = var.zone_id

  records  = each.value.records
}

resource "aws_route53_record" "txt_records" {
  for_each = var.txt_records
  name     = each.value.name
  ttl      = var.ttl
  type     = "TXT"
  zone_id  = var.zone_id

  records  = each.value.records
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
  for_each = var.srv_records
  name     = each.value.name
  ttl      = var.ttl
  type     = "SRV"
  zone_id  = var.zone_id

  records  = each.value.records
}