TF_STATEFILE=$(shell cat 00_configs/01_demo/demo_config_backend.tfvars | grep bucket | cut -d "=" -f 2 | tr -d \" | tr -d " ")
GCP_DEPLOY-USER=ada-svc-01
GCP_PROJECT=$(shell cat 00_configs/01_demo/demo_config.tfvars | grep gcp_project | cut -d "=" -f 2 | tr -d \" | tr -d " ")
GCP_REGION=$(shell cat 00_configs/01_demo/demo_config.tfvars | grep gke_cluster_region | cut -d "=" -f 2 | tr -d \" | tr -d " ")

init:
	gsutil mb -c regional -l $(GCP_REGION) gs://$(TF_STATEFILE)/ || true
	gcloud iam service-accounts create $(GCP_DEPLOY-USER) || true
	gcloud iam service-accounts keys create 06_secrets/ada-svc-001.json --key-file-type=json --iam-account=$(GCP_DEPLOY-USER)@$(GCP_PROJECT).iam.gserviceaccount.com
	@cd 01_infrastructure && terraform init --backend-config=../00_configs/01_demo/demo_config_backend.tfvars

plan:
	@terraform plan -var-file=00_configs/01_demo/demo_config.tfvars

test:
	@bash scripts/test.sh

