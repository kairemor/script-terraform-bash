output "backend" {
  value = aws_elb.backend_elb.dns_name
}

output "frontend" {
  value = aws_elb.frontend_elb.dns_name
}
