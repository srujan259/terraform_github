variable "repository_names" {
  type    = list(string)
  default = ["multi-docker", "docker-react"]
}

variable "required_status_checks" {
  type = list(map(string))
  default = [
    {
      context = "security/snyk"
      strict  = true
    },
    {
      context = "license/snyk"
      strict  = true
    },
    {
      context = "kitapi/integration_testing"
      strict  = true
    },
    # Add more status checks as needed
  ]
}