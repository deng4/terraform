run "example_test" {
  command = plan

  variables {
    check_protocol = "tcp"
  }

  assert {
    condition     = aws_vpc_security_group_ingress_rule.allow_http.ip_protocol == var.check_protocol
    error_message = "Test failed: the SSH port number is not equal to the actual one"
  }

}