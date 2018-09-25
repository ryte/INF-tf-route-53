resource "aws_route53_record" "a_records" {
  count   = "${length(var.a_records)}"
  name    = "${element(keys(var.a_records), count.index)}"
  ttl     = "${var.ttl}"
  type    = "A"
  zone_id = "${var.zone_id}"

  records = ["${element( values( var.a_records ), count.index )}"]
}

resource "aws_route53_record" "a_alias_records" {
  count   = "${length(var.a_alias_records)}"
  name    = "${element(keys(var.a_alias_records), count.index)}"
  type    = "A"
  zone_id = "${var.zone_id}"

  alias {
    name                   = "${element( values( var.a_alias_records ), count.index )}"
    zone_id                = "${var.zone_id}"
    evaluate_target_health = false
  }

}

resource "aws_route53_record" "cname_records" {
  count   = "${length(var.cname_records)}"
  name    = "${element(keys(var.cname_records), count.index)}"
  ttl     = "${var.ttl}"
  type    = "CNAME"
  zone_id = "${var.zone_id}"

  records = ["${element( values( var.cname_records ), count.index )}"]
}

resource "aws_route53_record" "txt_records" {
  count   = "${length(var.txt_records)}"
  name    = "${element(keys(var.txt_records), count.index)}"
  ttl     = "${var.ttl}"
  type    = "TXT"
  zone_id = "${var.zone_id}"

  records = ["${split(",", element( values( var.txt_records ), count.index ))}"]
}

resource "aws_route53_record" "mx_records" {
  count   = "${length(var.mx_records) > 1 ? 1 : 0}"
  name    = ""
  ttl     = "${var.ttl}"
  type    = "MX"
  zone_id = "${var.zone_id}"

  records = ["${var.mx_records}"]
}