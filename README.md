![IMAGE!](JJTech-AWS-ProjectScript\Repository\EKS-terra\README-IMAGE.TEST\Architerctural diagram.jpeg)

Deploy an EKS Cluster with Terraform
Before we start provisioning an EKS Cluster, there are a few prerequisites you need to have in mind and on hand.

Prerequisites
AWS Account
IAM User with programmatic access and proper permissions (AmazonEKSClusterPolicy and AdministratorAccess)
A code Editor (Visual Studio Code recommended)
Terraform installed on the code editor
AWS CLI installed and configured on the code editor
Kubernetes CLI installed and configured on the code editor
Once the prerequisites are met, we can start writing the code to create an EKS cluster.

Code
Step1: Terraform Initial Setup Configuration

Create an AWS provider.tf and the version.tf to interact with the AWS resources. Also create a remote_state.tf file to save the state file.

Step 2: Networking Module

For the network infrastructure, we will be creating the following:

AWS VPC (Virtual Private Cloud) of 10.0.0.0/16 CIDR range
Public and Private Subnets in different availability zones. A list of availability zones available will be auto-generated. To maintain high availability, Amazon EKS requires the subnets from at least two Availability Zones.
Internet Gateway to provide internet access for services within the public subnet in the VPC.
An Elastic IP to be used by the NAT Gateway
NAT Gateway in public subnets to allow services in the private subnets to connect to the internet.
Two Routing Tables (1 for public and 1 for Private) and associate the subnets with them.

Step 3: Cluster Module

EKS nodes need IAM roles to make calls to other AWS services (eks-node-group). These roles are attached with policies that allow assuming the temporary security credentials on the instance to access other AWS resources.

For the cluster infrastructure, we will be creating the following:

IAM role and role attachments to the policy (AmazonEKSClusterPolicy) for the cluster.
An EKS Cluster
IAM role and role attachments to the policy (AmazonEKSWorkerNodePolicy, AmazonEKS_CNI_Policy and AmazonEC2ContainerRegistryReadOnly) for the worker nodes.
Security groups for the cluster and the nodes.

Step 4: Using the modules created to provision the Cluster with all the needed resources

Step 5: Terraform execution to provision the resources

At this stage, all the necessary files are in place and it’s time to create the cluster. To provision the cluster, cd into the root directory and run the following commands:

terraform init → To download all the plugins, providers, and modules needed to provision the resources.

