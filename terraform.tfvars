repository_names = ["multi-docker", "docker-react", "demoapp"]

required_status_checks = [
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
  }
  # Add more status checks as needed
]
