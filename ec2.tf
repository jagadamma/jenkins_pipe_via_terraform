resource "aws_instance" "my1" {
  ami = "ami-0fc841be1f929d7d1"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.example_subnet_1.id
  security_groups = aws_security_group.sg.id

  ]
resource "aws_instance" "my2" {
  ami           = "ami-xxxxxxxxxxxxxx"  
  instance_type = "t2.micro" 
  subnet_id     = aws_subnet.example_subnet_2.id
  security_group_ids =  aws_security_group.sg.id

  tags = {
    Name = "ExampleInstance2"
  }
}  


resource "aws_security_group" "sg" {
  name        = "sg"
  description = "Web Security Group for HTTP"
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
}
