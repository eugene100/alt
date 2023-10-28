# Wlt test task

## Task
Hello,

In a scope of our interview, we would like offer to you make some test to get know you better as an engineer.  We have a term of completion, as we agreed before it is 30rd of October. The test task is:

Simple time application
1) Create an application on Go/Python that serve HTTP requests at the next routes:
- 8080:/
- 8080:/health
/ - returns local time in New-York, Berlin, Tokyo in HTML format
/health - return status code 200, in JSON format
2) Dockerize your app.
3) Provision your infra using Terraform:
- VPC
- Subnets
- SGs
- Routing tables
- EKS cluster
- ECR
4) Create and deploy Helm3 chart for your application.
5) Ensure that you have an access to the application endpoint externally
6) Provide an external http link
7) Upload your code to the Github public repository and provide link to us (put your code to the app, terraform, helm folders accordingly)

If you have any questions do not hesitate to ping me.

Regards!

## Development

### How to build docker image
```bash
cd app/simpletime/
docker build -t <image name> .
```

### How to run container
```bash
docker run -it -p 8080:8080 <image name>
# Check app health. Shuold return 200
curl http://localhost:8080/health
```
open URL http://localhost:8080 at your browser

### Deploy to k8s
Push image to ECR. ECR should be created before (terraform/dev/simpletime).
```bash
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 898344057637.dkr.ecr.us-east-1.amazonaws.com
docker tag f0146b5af542 898344057637.dkr.ecr.us-east-1.amazonaws.com/simpletime
docker push 898344057637.dkr.ecr.us-east-1.amazonaws.com/simpletime
```

## Infrastructure

Infrastructure is created using terraform. It creates VPC, EKS cluster, ECR repository and IAM roles.

### VPC
Located in terraform/dev/vpc. It creates VPC with 2 public subnets and 2 private subnets. Public subnets are used for EKS cluster. Private subnets are used for EKS worker nodes.

### EKS
Located in terraform/dev/eks. It creates EKS cluster and Fargate profiles.

Add dev-01 cluster to kubeconfig and switch to it
```
aws eks update-kubeconfig --region us-east-1 --name dev-01
kubectx arn:aws:eks:us-east-1:898344057637:cluster/dev-01
```

### simpletime
Located in terraform/dev/simpletime. It creates ECR repository for simpletime application.

## What can be improved

### Application
- Using WSGI instead of buildin
- Using templates instead of hardcoded html
