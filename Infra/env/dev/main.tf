module "ecr_dev"{
    source = "../../modules/ecr"
    name = "microservices-${var.environment}"
    image_tag_mutability = "MUTABLE"
}