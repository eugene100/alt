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
