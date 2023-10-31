data "github_repository" "existing_repos" {
  count = length(var.repository_names)
  name  = var.repository_names[count.index]
}

data "aws_secretsmanager_secret" "github_pat_secret" {
  name = "git_pat"
}

data "aws_secretsmanager_secret_version" "pat" {
  secret_id = data.aws_secretsmanager_secret.github_pat_secret.id
}