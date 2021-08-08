terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 4.0"
    }
  }
}

# Configure the GitHub Provider
provider "github" {
    token = "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"
}

resource "github_repository" "example" {
  name        = "terraform-repo"
  description = "My awesome codebase"

  visibility = "private"
}

# Add a user to the organization
//resource "github_membership" "membership_for_user_x" {
  # ...
# }