# AWS CloudFormation Using Terraform

This repository contains Infrastructure as Code (IaC) templates written in Terraform to provision secure AWS resources. The project integrates continuous delivery and security checks using GitHub Actions with tools like **tfsec** and **checkov** to ensure the infrastructure follows best practices.

## Features
- **Terraform IaC**: Automate the provisioning of AWS resources.
- **GitHub Actions**: Continuous Integration/Continuous Deployment (CI/CD) pipeline integrated with GitHub Actions.
- **Security Checks**: Integrated security checks using **tfsec** and **checkov** to enforce best practices and compliance in your infrastructure.

## Tools & Technologies
- **Terraform**: Infrastructure as Code tool for provisioning AWS resources.
- **GitHub Actions**: CI/CD for automating workflows.
- **tfsec**: Static analysis tool for security vulnerabilities in Terraform code.
- **checkov**: Static code analysis tool to ensure the infrastructure is secure and compliant.

## Prerequisites
To get started, you need the following tools installed on your local machine:

- [Terraform](https://www.terraform.io/downloads.html)
- [Git](https://git-scm.com/)
- [AWS CLI](https://aws.amazon.com/cli/)

## Setup

### 1. Clone the Repository

```bash
git clone https://github.com/Pratham-verma/AWS_CloudFormation_Using_Terraform.git
cd AWS_CloudFormation_Using_Terraform
```
### 2. Configure AWS Credentials

```bash
aws configure
```
### 3. Install Terraform Dependencies

```bash
terraform init
```
### 4. Apply the Terraform Configuration

```bash
terraform apply
```
## GitHub Actions CI/CD Workflow

This repository has a GitHub Actions workflow to run security checks using tfsec and checkov.
Workflow Overview:

    tfsec: Runs static analysis to identify security issues in the Terraform code.

    checkov: Scans Terraform templates for security and compliance violations.

When you push changes to the main branch or create a pull request, GitHub Actions will automatically run these security checks.
Contributing

Feel free to open issues or submit pull requests. If you want to contribute, please follow these steps:

    Fork the repository.

    Clone your fork locally.

    Create a new branch for your feature or fix.

# Thank you and Feel Free to contribute.

    Commit your changes.

    Push your changes to your fork.

    Create a pull request to merge your changes into the main branch.

