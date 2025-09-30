module "ecr_dev"{
    source = "../../modules/ecr"
    name = "microservices-${var.environment}"
    image_tag_mutability = "MUTABLE"
}

module "s3"{
    source = "../../modules/s3"
    bucket_name = "microservices-helmcharts-${var.environment}-323424"
    environment = var.environment
}