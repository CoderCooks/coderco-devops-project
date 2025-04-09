[
  {
    "name": "${container_name}",
    "image": "${image_url}",
    "cpu": "${cpu}",
    "memory": "${memory}",
    "essential": true,
    "portMappings": [
      {
        "containerPort": 3000,
        "hostPort": 3000
      }
    ]
  }
]
