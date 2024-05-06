
## Application

This application counts the number of unique visitors and stores this information in a PostgreSQL database.

### Endpoints

- `/`: Main page displaying all data.
- `/version`: JSON response with the current app version.

## Infrastructure

The infrastructure for this solution is deployed on Azure (preferred) or AWS, using Terraform as infrastructure as code.

### System Diagram

Please refer to the `abb_poc.drawio` file for the system diagram.

## Containerization

To test this application locally, it can be deployed using Docker and Docker Compose.

## CI/CD

Continuous Integration and Continuous Deployment are automated using GitHub Actions (or any preferred CI/CD tool).

### GitHub Actions

GitHub Actions workflows are provided for deploying the application directly on AWS or Azure using Terraform. Additionally, there are workflows for deploying serverless applications on AWS.

### GitLab

GitLab CI/CD configurations are provided for deploying microservices on Azure.

## Kubernetes CLI (multims)

The `multims` CLI tool allows for easy management and deployment of microservices on Kubernetes. It provides options to program and deploy applications in both production and non-production environments directly from your local machine. You can specify configurations such as Kubernetes context, container registry, technology stack, namespace, and more.

### Example Configuration

```yaml
kubeConfigPath: /Users/jacktorpoco/.kube/config
kubeContext: mi-cuenta-publica-context
registryOrDocker: DockerHub
registry: ""
technology: Node
namespace: local
useDefaultKubeConfig: true
uid: a1d1c518-5ad9-48dc-80b6-be2881b00aba
appName: abb_node
application:
  start_run: node index.js
  port: 3000
multiservices: []
database:
  type: postgres
  active: true
  db: postgres
  user: postgres
  password: password
  name: mydb
  external: true
installationcommands:
- ""
```



# Monitoring

Monitoring for this application involves tracking its performance, health, and behavior to ensure smooth operation and detect any issues promptly. Here's how you can monitor your application and the systems you can use for it:

## Application Performance Monitoring (APM)

APM tools provide insights into the performance and behavior of your application code. They help identify performance bottlenecks, optimize code, and improve user experience.

### Recommended APM Tools:
1. **Prometheus**: Open-source monitoring and alerting toolkit with a powerful query language and flexible visualization options.
2. **New Relic**: A comprehensive APM solution that offers real-time insights into application performance, user experience, and infrastructure monitoring.
3. **Datadog**: Cloud-based monitoring platform that provides full-stack observability, including APM, infrastructure monitoring, and log management.

## Infrastructure Monitoring

Infrastructure monitoring focuses on tracking the health and performance of the underlying infrastructure components, such as servers, databases, and networking resources.

### Recommended Infrastructure Monitoring Tools:
1. **Grafana**: Open-source analytics and monitoring platform that integrates with various data sources, including Prometheus, to visualize metrics and create dashboards.
2. **Azure Monitor**: A cloud-based monitoring and management service provided by Microsoft Azure, offering insights into the performance and health of Azure resources, applications, and workloads.

## Differences between Serverless and Microservices/Containers

### Serverless:
- Serverless architectures abstract away server management and scaling tasks from developers, allowing them to focus solely on writing code.
- With serverless, applications are broken down into small, event-driven functions that are executed in response to events.
- Serverless platforms, such as AWS Lambda or Azure Functions, automatically handle infrastructure provisioning, scaling, and resource management.
- Monitoring serverless applications requires tracking function invocations, execution times, error rates, and resource utilization metrics provided by the serverless platform.

### Microservices/Containers:
- Microservices architecture involves breaking down an application into smaller, loosely coupled services that communicate via APIs.
- Each microservice can be developed, deployed, and scaled independently, providing flexibility and agility.
- Containers, such as Docker, are often used to package microservices along with their dependencies, ensuring consistency across different environments.
- Monitoring microservices/containerized applications involves tracking metrics related to service health, resource usage, latency, and communication between services.

## Documentation

### Technologies Used

#### Programming Languages:
- Python or JavaScript

#### Database:
- PostgreSQL

#### Infrastructure as Code:
- Terraform

#### Containerization:
- Docker
- Docker Compose

#### CI/CD:
- GitHub Actions
- GitLab CI/CD

#### Cloud Providers:
- Azure (preferred)
- AWS

#### Kubernetes CLI:
- multims

### Getting Started

1. **Clone this repository**: 
   ```bash
   git clone <repository_url>
   cd <repository_directory>
   ```
2. Configure Credentials and Environment Variables:
Ensure you have the necessary credentials for your cloud provider (Azure or AWS).
Set up environment variables required for the application and infrastructure configuration.
3. Set up PostgreSQL Server:
Install and configure PostgreSQL server according to your environment and requirements.
4. Deploy Infrastructure using Terraform:
Navigate to the iac directory.
Run terraform init to initialize Terraform.
Run terraform plan to review the execution plan.
Run terraform apply to apply the changes and deploy the infrastructure.
5. Build and Deploy Application:
Depending on your choice:
For Docker:
Build the Docker image: docker build -t <image_name> .
Run the Docker container: docker run -d -p <host_port>:<container_port> <image_name>
For Serverless Deployment:
Follow the instructions provided in the relevant serverless deployment guide.


## Diagrams
System architecture diagrams can be found in the abb_poc.drawio file.

