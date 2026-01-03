variable "project_name" {
  default = "roboshop"
}

variable "environment" {
  default = "dev"
}

variable "sg_name" {
  default = [
    # database
    "mongodb","redis","mysql","rabbitmq",
    # backend
    "catalogue","user","cart","shipping","payment",
    # frontend
    "frontend",
    # bastion
    "bastion",
    # frontend-loadbalancer
    "frontend_alb",
    #backend alb
    "backend_alb",
    "openvpn"
  ]
}