variable "repository_names" {
  type    = list(string)
}

variable "required_status_checks" {
  type = list(map(string))
}