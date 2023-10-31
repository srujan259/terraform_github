#multiple
provider "github" {
  token = "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"
}

variable "repository_names" {
  type    = list(string)
  default = ["argocd1", "argocd-gitops"]
}

data "github_repository" "existing_repos" {
  count = length(var.repository_names)
  name  = var.repository_names[count.index]
}

resource "github_branch_protection" "snyk_protection" {
  count         = length(data.github_repository.existing_repos[*].id)
  repository_id = data.github_repository.existing_repos[count.index].id
  pattern       = "main"

  required_status_checks {
    strict   = true
    contexts = ["snyk"]
  }

  required_pull_request_reviews {
    dismiss_stale_reviews = false
    require_code_owner_reviews = true
    required_approving_review_count = 1
  }
}
