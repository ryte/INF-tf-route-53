resource "aws_route53_record" "a_records" {
  count   = "${length(var.a_records)}"
  name    = "${element( split(";", element( var.a_records, count.index ) ), 0 )}"
  ttl     = "${var.ttl}"
  type    = "A"
  zone_id = "${var.zone_id}"

  records = ["${trimspace(element( split(";", element( var.a_records, count.index ) ), 1 ))}"]
}

resource "aws_route53_record" "a_alias_records" {
  count   = "${length(var.a_alias_records)}"
  name    = "${element( split(";", element( var.a_alias_records, count.index ) ), 0 )}"
  type    = "A"
  zone_id = "${var.zone_id}"

  alias {
    name                   = "${element( split(",", trimspace(element( split(";", element( var.a_alias_records, count.index ) ), 1 )) ), 0 )}"
    zone_id                = "${element( split(",", trimspace(element( split(";", element( var.a_alias_records, count.index ) ), 1 )) ), 1 )}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "cname_records" {
  count   = "${length(var.cname_records)}"
  name    = "${element( split(";", element( var.cname_records, count.index ) ), 0 )}"
  ttl     = "${var.ttl}"
  type    = "CNAME"
  zone_id = "${var.zone_id}"

  records = ["${trimspace(element( split(";", element( var.cname_records, count.index ) ), 1 ))}"]
}

resource "aws_route53_record" "txt_records" {
  count   = "${length(var.txt_records)}"
  name    = "${element( split(";", element( var.txt_records, count.index ) ), 0 )}"
  ttl     = "${var.ttl}"
  type    = "TXT"
  zone_id = "${var.zone_id}"

  records = ["${trimspace(element( split(";", element( var.txt_records, count.index ) ), 1 ))}"]
}

resource "aws_route53_record" "txt_record_root" {
  count   = "${length(var.txt_record_root) > 1 ? 1 : 0}"
  name    = ""
  ttl     = "${var.ttl}"
  type    = "TXT"
  zone_id = "${var.zone_id}"

  records = ["${var.txt_record_root}"]
}

resource "aws_route53_record" "mx_records" {
  count   = "${length(var.mx_records) > 1 ? 1 : 0}"
  name    = ""
  ttl     = "${var.ttl}"
  type    = "MX"
  zone_id = "${var.zone_id}"

  records = ["${var.mx_records}"]
}

resource "aws_route53_record" "srv_records" {
  count   = "${length(var.srv_records)}"
  name    = "${element( split(";", element( var.srv_records, count.index ) ), 0 )}"
  ttl     = "${var.ttl}"
  type    = "SRV"
  zone_id = "${var.zone_id}"

  records = ["${trimspace(element( split(";", element( var.srv_records, count.index ) ), 1 ))}"]
}