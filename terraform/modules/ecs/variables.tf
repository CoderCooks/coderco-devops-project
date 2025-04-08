//Variables for the ECS module
variable "ecs_cluster_name" {
  description = "The name of the ECS cluster"
  type        = string
}
variable "ecs_service_name" {
  description = "The name of the ECS service"
  type        = string
}
variable "ecs_task_definition" {
  description = "The task definition for the ECS service"
  type        = string
}
variable "ecs_task_role_arn" {
  description = "The ARN of the IAM role that the ECS task can assume"
  type        = string
}
variable "ecs_execution_role_arn" {
  description = "The ARN of the IAM role that the ECS task can assume for execution"
  type        = string
}
variable "ecs_network_mode" {
  description = "The network mode to use for the ECS task"
  type        = string
  default     = "awsvpc"
}
variable "ecs_cpu" {
  description = "The number of CPU units to use for the ECS task"
  type        = string
  default     = "256"
}           