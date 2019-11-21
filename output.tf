output "a_records" {
  value = aws_route53_record.a_records.*.fqdn
}

output "a_alias_records" {
  value = aws_route53_record.a_alias_records.*.fqdn
}

output "cname_records" {
  value = aws_route53_record.cname_records.*.fqdn
}

output "txt_records" {
  value = aws_route53_record.txt_records.*.fqdn
}

output "txt_record_root" {
  value = aws_route53_record.txt_record_root.*.fqdn
}

output "mx_records" {
  value = aws_route53_record.mx_records.*.fqdn
}

output "srv_records" {
  value = aws_route53_record.srv_records.*.fqdn
}

