#!/bin/bash

#Package endpoints lambda releases
cd endpoints
sudo apt-get install nodejs
pwd
for folderName in `find . -mindepth 1 -maxdepth 1 -type d`; do
  echo $folderName
  cd $folderName
  npm install
  zip -r lambda_function_payload.zip .
  cd ..
done;

#Package SQS triggers lambda releases
pwd
cd sqs_triggers
for folderName in `find . -mindepth 1 -maxdepth 1 -type d`; do
  echo $folderName
  cd $folderName
  npm install
  zip -r lambda_function_payload.zip .
  cd ..
done;

#Apply terraform changes
cd infrastructure
terraform init
terraform plan
