##################################################################################
# Lunch Configuation kind of template to run
##################################################################################

resource "aws_launch_configuration" "backend" {
  name_prefix = "back-"

  image_id      = var.image_id
  instance_type = var.instance_type
  key_name      = var.key_name

  security_groups             = [aws_security_group.allow_http.id]
  associate_public_ip_address = true

  user_data = data.template_file.backend.rendered

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_launch_configuration" "frontend" {
  name_prefix = "front-"

  image_id      = var.image_id
  instance_type = var.instance_type
  key_name      = var.key_name

  security_groups             = [aws_security_group.allow_http.id]
  associate_public_ip_address = true

  user_data = data.template_file.frontend.rendered
  lifecycle {
    create_before_destroy = true
  }
}

data "template_file" "backend" {
  template = file(var.backend_bash_path)
  vars = {
    PROJECT_NAME       = var.back_project_name,
    PROJECT_REPOSITORY = var.jar_file_url,
    PORT               = var.backend_port,
    MAIN_FILE          = var.main_file,
    DB_URI             = var.db_uri
  }
}

data "template_file" "frontend" {
  template = file(var.frontend_bash_path)
  vars = {
    PROJECT_NAME       = var.front_project_name,
    PROJECT_REPOSITORY = var.project_repository,
    BACKEND_URL        = aws_elb.backend_elb.dns_name
  }
}
