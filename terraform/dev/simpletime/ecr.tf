# Create ECR Repository
resource "aws_ecr_repository" "simpletime_ecr" {
  name = "simpletime"
}

# Output the ECR repository URL
output "ecr_repository_url" {
  value = aws_ecr_repository.simpletime_ecr.repository_url
}
