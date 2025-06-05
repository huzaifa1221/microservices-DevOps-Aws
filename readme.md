# DevOps and Infrastructure Instructions -

### This is a Full-Stack Application that runs in Docker containers and is deployed to EKS cluster using helm charts whenever ci/cd pipeline gets triggered.

- Size of Docker Images are decreased by ~80% using multi-stage docker builds and appropriate base image.
- Helm charts are used for packaging.
- The CI/CD pipeline has a specific trigger points for each service.
- The secrets are safely stored in GITHUB SECRETS and are used in the pipeline.
- The entire Infrastructure required for the application is provisioned using Terraform on AWS. (EKS, ECR, IAM roles and policies, VPC, SUBNETS, INTERNET GATEWAY, ROUTE TABLES)


# Development Instructions
- [Development Instructions](development-readme.md)
