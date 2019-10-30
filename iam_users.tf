provider "aws" {
  region		  = "us-west-2"
}

variable "username" {
  type    = "list"
  default = ["mark", "artur", "luis", "garrett"]
}

resource "aws_iam_group" "thegroup" {
  name   = "thegroup"
  path   = "/cit480/"
}

resource "aws_iam_user" "user_creation" {
  count  = "${length(var.username)}"
  name   = "${element(var.username, count.index)}"
  path   = "/cit480/"
}

resource "aws_iam_user_group_membership" "add" {
  count = "${length(var.username)}"
  user = "${element(var.username, count.index)}"

  groups = [
    "${aws_iam_group.thegroup.name}",
  ]
}
