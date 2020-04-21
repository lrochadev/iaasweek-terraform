resource "aws_route_table" "private" {
  count  = var.az_count
  vpc_id = aws_vpc.main.id

  # Adicionando uma nova entrada. Tudo que entrar pelo 0.0.0.0/0, vai sair pelo essa nat_gateway_id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = element(aws_nat_gateway.gw.*.id, count.index)
  }

  tags = {
    Environment = "iaasweek"
  }
}

resource "aws_route_table_association" "private" {
  count          = var.az_count
  subnet_id      = element(aws_subnet.private.*.id, count.index)
  route_table_id = element(aws_route_table.private.*.id, count.index)
}
