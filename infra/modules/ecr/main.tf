resource "aws_ecr_repository" "game_2048_ecr_repo" {
  name                 = "2048-ecr-repo"
  image_tag_mutability = "MUTABLE"
  image_scanning_configuration {
    scan_on_push = true
  }
}