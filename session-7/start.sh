#! /bin/bash

rm -rf .terrafaform*

ENV=$1

if [ -z "$ENV" ]; then
   echo "Usage: $0 <env>"
   exit 1
fi

sed -i '' "s/_env_/$ENV/g" backend.tf

echo "Environment is set to $ENV"

terraform init -reconfigure
terraform destroy -var-file=$ENV.tfvars --auto-approve

echo "Rolling back to static string"

sed -i '' "s/$ENV/_env_/g" backend.tf

echo "Infra is deployed to $ENV and backend.tf is rolled back"