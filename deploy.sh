#!/bin/bash

#Apply terraform changes
terraform init
terraform plan -var-file="secret.tfvars"
