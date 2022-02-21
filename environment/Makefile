do-all: init apply

init:
	terraform init -backend-config="backend-dev.config"

plan:
	terraform plan -var-file=devops-challenge.tfvars

apply:
	terraform apply -var-file=devops-challenge.tfvars
	bash cluster-extra-addons.sh