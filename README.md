# Private VM Accessing Internet using Cloud NAT (Terraform)

## Scenario Overview

This project provisions a private virtual machine in Google Cloud that has:
- No public IP
- Outbound internet access
- Secure SSH access via IAP
- Cloud NAT for egress traffic

Architecture Flow:

Private VM → Default Route → Cloud Router → Cloud NAT → Internet

## What This Project Creates

- Custom VPC
- Private Subnet (10.10.0.0/24)
- Firewall rule allowing SSH from IAP
- Private VM without public IP
- Cloud Router
- Cloud NAT (auto allocated external IP)

## Why Cloud NAT?

Cloud NAT allows outbound internet access for private instances
without exposing them to inbound public traffic.

It performs source NAT translation:
- Private IP (10.10.0.x)
- Translated to Google-managed public IP
- Response traffic mapped back to original VM

## Deployment Steps

1. Configure project:
   gcloud config set project YOUR_PROJECT_ID

2. Initialize Terraform:
   terraform init

3. Review plan:
   terraform plan

4. Deploy:
   terraform apply

## SSH Access

Use IAP tunnel:

gcloud compute ssh private-vm   --zone=asia-south1-a   --tunnel-through-iap

## Test Internet Connectivity

Inside VM:

curl ifconfig.me
sudo apt update

If successful, Cloud NAT is working.

## Cleanup

terraform destroy

## Production Improvements

- Use reserved static external IP for NAT
- Enable Cloud NAT logging
- Add remote backend (GCS)
- Implement multi-environment structure
- Add CI/CD pipeline

---

This repository demonstrates a secure enterprise-style outbound connectivity pattern in Google Cloud.