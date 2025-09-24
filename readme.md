# Introduction -

#### This is a microservices based project that showcases the power and importance of DevOps in management of applications to ensure high availability and scalability with zero downtime. This project manages two environments ( dev and prod ) for now. It can easily scale to support as many environment as needed with a little tweak.

#### Features -

- Size of Docker Images are decreased by ~80% using multi-stage docker builds and appropriate base image.
- Helm charts are used for packaging.
- The CI/CD pipeline has a specific trigger points for each service.
- The secrets are safely stored in GITHUB SECRETS and are used in the pipeline.
- The entire Infrastructure required for the application is provisioned using Terraform on AWS. (EKS, ECR, IAM roles and policies, VPC, SUBNETS, INTERNET GATEWAY, ROUTE TABLES)
- The Terraform uses s3 backed to persist tfstate file.

#### Infratructure  -

#### System Architecture -

![architecture svg](readme-images/system-arch.svg)

#### CI/CD Architecture -

# Development Instructions
- [Development Instructions](development-readme.md)
