#multiple
provider "github" {
  token = data.aws_secretsmanager_secret_version.pat.secret_string
}

provider "aws" {
  region = "us-east-1"
}

resource "github_branch_protection" "snyk_protection" {
  count         = length(data.github_repository.existing_repos[*].id)
  repository_id = data.github_repository.existing_repos[count.index].id
  pattern       = "main"

  required_status_checks {
    strict   = true
    contexts = var.required_status_checks[*].context
  }
  required_pull_request_reviews {
    dismiss_stale_reviews           = false
    require_code_owner_reviews      = false
    required_approving_review_count = 1
  }
}
