## About
This project creates a Kubernetes infrastructure with terraform used to deploy 
an application with helm.

###Challenge Requirements

Develop an application, in the language of your choice, that provides an endpoint to check if a number is prime or not. It will be nice for the application to use Redis for caching if you can.
* Service must be deployed with helm.
* All infrastructure must be written in terraform.
* It should be deployed in the k8s cluster that you spin.
* If you end up using the Redis, it should not be self-hosted. Use the Redis provided by the cloud you pick.
* Service must be publicly accessible.

###Resources Created:

- VPC
- 2 Public Subnets
- 2 Private Subnets
- EKS Cluster
- EKS Managed Node Group
- Application that checks if a number is prime

###Validated Resource Versions

- Terraform v0.14.11
- Helm v3.8.0
- Docker v20.10.8

##Environment

To create the environment you need to be in the directory `environment`, 
it was used most of _cloudposse_ modules and a shell scripting to deploy extra addons.
The decision to use community modules is based on saving time and make it simple to use.
The custom parameters may be changed in the file `devops-challenge.tfvars`.

To init terraform environment you may just run `make init`.

To run a terraform plan you can just use `make plan`

To create the environment, just run `make apply`

And if you want to init and apply in the same command, run `make do-all`

The output from terraform plam should be something like:
```
Plan: 45 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + eks_cluster_arn                       = (known after apply)
  + eks_cluster_endpoint                  = (known after apply)
  + eks_cluster_id                        = (known after apply)
  + eks_cluster_identity_oidc_issuer      = (known after apply)
  + eks_cluster_managed_security_group_id = (known after apply)
  + eks_cluster_version                   = "1.21"
  + eks_node_group_arn                    = (known after apply)
  + eks_node_group_id                     = (known after apply)
  + eks_node_group_resources              = [
      + (known after apply),
    ]
  + eks_node_group_role_arn               = (known after apply)
  + eks_node_group_role_name              = "dev-moulin-workers"
  + eks_node_group_status                 = (known after apply)
  + private_subnet_cidrs                  = [
      + "10.100.0.0/20",
      + "10.100.16.0/20",
    ]
  + public_subnet_cidrs                   = [
      + "10.100.96.0/20",
      + "10.100.112.0/20",
    ]
  + vpc_cidr                              = "10.100.0.0/16"
  ```

##Application
The application source and config and helm chart is in the directory `applications`. 
The helm chart is basically created runnig `helm create app-chart`
with some adaptations regarding service resources to create services of type LoadBalancer

To build the container image locally, you can run `make build`, 
but the image used to deploy is stored in dockerhub `gmoulindan/prime-app:latest` 
as it was not mandatory to create a pipeline to it.

To deploy the app you can run `make deploy`

##Final Comments

This project was made based in the minimum requirements and has lots of things that the 
author thinks should be changed, some of them are:

* Create another set of subnets where to deploy databases;
* To do a deep dive in the used terraform modules to check if everything it is creating is needed.
* Create custom tags in the resources regarding cost-center/Squad/Tribe.
* Create a complete pipeline to deploy services:
  * Unit tests
  * Integration tests
  * Load tests
  * Contract tests(if applicable)
  * Cache restore tests(if applicable)
  * Vulnerabilities tests
  * Build
  * Deploy
* Install more complete monitoring tools, such as prometheus
* Enable to use prometheus custom metrics as HPA parameters together with the ones existing
* Install external-dns to configure DNS entries when a new service is created
* Fine tunning in the cluster-autoscaler parameters
* Use pod affinity/antiaffinity as needed
