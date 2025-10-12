#####
# ECS cluster to run the app on fargate
#####

resource "aws_ecs_cluster" "main" {
  name = "${local.prefix}-cluster"
}