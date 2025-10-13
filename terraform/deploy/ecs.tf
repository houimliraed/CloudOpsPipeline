#####
# ECS cluster to run the app on fargate
#####

resource "aws_iam_policy" "task_execution_role_policy" {
  name        = "${local.prefix}-task-exec-role-policy"
  path        = "/"
  description = "allow ecs to retrieve images and add to logs"
  policy      = file("./templates/ecs/task-execution-role-policy.json")

}

resource "aws_iam_role" "task_execution_role" {

  name               = "${local.prefix}-task-execution-role"
  assume_role_policy = file("./templates/ecs/task-assume-role-policy.json")
}

resource "aws_iam_role_policy_attachment" "task_execution_role" {
  role       = aws_iam_role.task_execution_role.name
  policy_arn = aws_iam_policy.task_execution_role_policy.arn
}

resource "aws_iam_role" "app_task" {

  name               = "${local.prefix}-app-task"
  assume_role_policy = file("./templates/ecs/task-assume-role-policy.json")

}
resource "aws_iam_policy" "task_ssm_policy" {
  name        = "${local.prefix}-task-ssm-role-policy"
  path        = "/"
  description = "policy to allow system manager to execute in container"
  policy      = file("./templates/ecs/task-ssm-policy.json")

}

resource "aws_iam_role_policy_attachment" "task-ssm-policy" {
  role       = aws_iam_role.app_task.name
  policy_arn = aws_iam_policy.task_ssm_policy.arn
}

resource "aws_cloudwatch_log_group" "ecs_task_logs" {
  name = "${local.prefix}-api"

}



resource "aws_ecs_cluster" "main" {
  name = "${local.prefix}-cluster"
}