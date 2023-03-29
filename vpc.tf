# Створення нової VPC
resource "aws_vpc" "example" {
  cidr_block = "10.0.0.0/16"
}

# Створення public subnet в створенний VPC
resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.example.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = true
}

# Створення інтернет шлюзу
resource "aws_internet_gateway" "example" {
  vpc_id = aws_vpc.example.id
}

# Створення маршрутів для публічної підмережі через інтернет-шлюз
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.example.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.example.id
  }

  tags = {
    Name = "PublicRoutes"
  }
}

# Прив'язуємо public subnet до публічної маршрутної таблиці
resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

# Створення групи безпеки
resource "aws_security_group" "example" {
  name_prefix = "example"
  vpc_id      = aws_vpc.example.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Активація імені сайту DNS
resource "aws_route53_record" "example" {
  zone_id = var.zone_id
  name    = var.hostname
  type    = "A"
  ttl     = 300
  records = [aws_subnet.public.id]
}
