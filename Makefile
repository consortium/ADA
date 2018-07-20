TF_STATEFILE=$(shell cat 00_configs/01_demo/demo_config_backend.tfvars | grep bucket | cut -d "=" -f 2 | tr -d \" | tr -d " ")
GCP_DEPLOY-USER=ada-svc-01
GCP_PROJECT=$(shell cat 00_configs/01_demo/demo_config.tfvars | grep gcp_project | cut -d "=" -f 2 | tr -d \" | tr -d " ")
GCP_REGION=$(shell cat 00_configs/01_demo/demo_config.tfvars | grep gke_cluster_region | cut -d "=" -f 2 | tr -d \" | tr -d " ")

init: bucket account terraform-init

build: terraform-plan terraform-apply

bucket:
	gsutil mb -c regional -l $(GCP_REGION) gs://$(TF_STATEFILE)/

account:
	gcloud iam service-accounts create $(GCP_DEPLOY-USER) || true
	gcloud iam service-accounts keys create 06_secrets/ada-svc-001.json --key-file-type=json --iam-account=$(GCP_DEPLOY-USER)@$(GCP_PROJECT).iam.gserviceaccount.com
	gcloud projects add-iam-policy-binding $(GCP_PROJECT) \
    --member serviceAccount:$(GCP_DEPLOY-USER)@$(GCP_PROJECT).iam.gserviceaccount.com --role roles/editor

terraform-init:
	@cd 01_infrastructure && terraform init --backend-config=../00_configs/01_demo/demo_config_backend.tfvars

terraform-plan:
	@cd 01_infrastructure && terraform plan -var-file=../00_configs/01_demo/demo_config.tfvars

terraform-apply:
	@cd 01_infrastructure && terraform apply -var-file=../00_configs/01_demo/demo_config.tfvars

clean:
	@cd 01_infrastructure && terraform destroy -var-file=../00_configs/01_demo/demo_config.tfvars
	gcloud iam service-accounts delete $(GCP_DEPLOY-USER)@$(GCP_PROJECT).iam.gserviceaccount.com
	gsutil rm -r gs://$(TF_STATEFILE)/
	rm 06_secrets/ada-svc-001.json
	find . -type f -name ".terraform*" -delete


test:
	@bash scripts/test.sh

