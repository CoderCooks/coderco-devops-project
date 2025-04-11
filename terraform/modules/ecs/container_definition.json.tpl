[
  {
    "name": "${container_name}",
    "image": "${image_url}",
    "cpu": 1024,
    "memory": 3072,
    "essential": true,
    "portMappings": [
      {
        "containerPort": 3000,
        "hostPort": 3000
      }
    ]
  }
]
