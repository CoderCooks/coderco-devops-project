//TODO: Create Terraform Infrastructure for ECS --> cluster, task definition, service etc)
// Terrafor

//Reference existing ECR repository
data "aws_ecr_repository" "ecr" {
  name = var.ecr_repo_name
}

//Import aws existing ecs execution role 
data "aws_iam_role" "ecs_execution_role" {
  name = "ecsTaskExecutionRole"
}

resource "aws_cloudwatch_log_group" "ecs_log_group" {
  name              = "/ecs/${var.project_name}-container-image"
  retention_in_days = 7
}
//ECS Cluster
resource "aws_ecs_cluster" "ecs-cluster" {
  name = "${var.project_name}-ecs-cluster"
  
}

//ECS Cluster capacity providers
resource "aws_ecs_cluster_capacity_providers" "ecs-capacity_provider" {
  cluster_name = aws_ecs_cluster.ecs-cluster.name

  capacity_providers = ["FARGATE"]

  default_capacity_provider_strategy {
    base              = 1
    weight            = 100
    capacity_provider = "FARGATE"
  }
}


//ECS Task definition
resource "aws_ecs_task_definition" "ecs-task-definition" {
  family = "${var.project_name}-ecs-task-definition"
  network_mode          = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  execution_role_arn = data.aws_iam_role.ecs_execution_role.arn
  cpu                      = var.ecs_task_cpu
  memory                   = var.ecs_task_memory
   //TODO: Ensure ecr repositry uri is being referenced correctly
   container_definitions = templatefile("${path.module}/container_definition.json.tpl", {
    container_name = "${var.project_name}-container-image"
    image_url      = data.aws_ecr_repository.ecr.repository_url
    cpu                      = var.ecs_task_cpu
    memory                   = var.ecs_task_memory
  })
 runtime_platform {
  operating_system_family = var.operating_system_family
  cpu_architecture        = var.cpu_architecture
}

}

//The security group for the ECS Service
resource "aws_security_group" "ecs_security_group" {
  name        = "${var.project_name}-ecs_sg"
  description = "The ECS service security group"
  vpc_id      = var.vpc_id

  ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    security_groups = [var.alb_security_group] 
    description      = "Allow all traffic from ALB security group"
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.allowed_cidr_blocks
  }
}


//ECS Service
resource "aws_ecs_service" "ecs-service" {
  name            = "ecs-service"
  cluster         = aws_ecs_cluster.ecs-cluster.id
  launch_type = "FARGATE"
  task_definition = aws_ecs_task_definition.ecs-task-definition.arn
  desired_count   = 1
  force_new_deployment = true    
    load_balancer {
    target_group_arn = var.target_group_arn  # Reference target group ARN from ALB module
    container_name      = "${var.project_name}-container-image"
    container_port   = 3000
  }

  network_configuration {
    subnets = var.subnets
    security_groups = [aws_security_group.ecs_security_group.id]
    # assign_public_ip = true    

  }

  # depends_on = [aws_lb_listener.app_listener]

}



# VPC Endpoints for ECR/ECS
resource "aws_security_group" "endpoint_sg" {
  name        = "vpc-endpoint-sg"
  description = "Security group for VPC endpoints like ECR and SSM"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    security_groups = [aws_security_group.ecs_security_group.id] # ECS task SG
    description = "Allow HTTPS from ECS tasks"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# ECR API endpoint
resource "aws_vpc_endpoint" "ecr_api" {
  vpc_id            = var.vpc_id
  service_name      = "com.amazonaws.eu-west-2.ecr.api"
  vpc_endpoint_type = "Interface"
  subnet_ids        = var.subnets
  security_group_ids = [aws_security_group.endpoint_sg.id]
}

# ECR DKR endpoint
resource "aws_vpc_endpoint" "ecr_dkr" {
  vpc_id            = var.vpc_id
  service_name      = "com.amazonaws.eu-west-2.ecr.dkr"
  vpc_endpoint_type = "Interface"
  subnet_ids        = var.subnets
  security_group_ids = [aws_security_group.endpoint_sg.id]
}
