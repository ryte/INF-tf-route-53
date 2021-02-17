output "a_records" {
  value = aws_route53_record.a_records
}

output "aaaa_records" {
  value = aws_route53_record.aaaa_records
}

output "a_alias_records" {
  value = aws_route53_record.a_alias_records
}

output "aaaa_alias_records" {
  value = aws_route53_record.aaaa_alias_records
}

output "cname_records" {
  value = aws_route53_record.cname_records
}

output "txt_records" {
  value = aws_route53_record.txt_records
}

output "mx_records" {
  value = aws_route53_record.mx_records
}

output "srv_records" {
  value = aws_route53_record.srv_records
}
