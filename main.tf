provider "aws" {
  version = "2.33.0"

  region = var.aws_region
}

resource "aws_dynamodb_table" "tfc_example_table" {
  name = var.db_table_name

  read_capacity  = var.db_read_capacity
  write_capacity = var.db_write_capacity
  hash_key       = "UID"
  range_key      = "UserName"

  attribute {
    name = "UID"
    type = "S"
  }

  attribute {
    name = "UserName"
    type = "S"
  }

  tags = {
    user_name = var.tag_user_name
  }
}
resource "aws_instance" "basic" {
  ami           = "ami-0ee1a20d6b0c6a347"
  instance_type = "t3.nano"
}
