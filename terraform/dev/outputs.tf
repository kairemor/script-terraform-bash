output "backend" {
  value = aws_instance.backend.public_ip
}

output "frontend" {
  value = aws_instance.frontend.public_ip
}

output "database" {
  value = aws_instance.db.public_ip
}

