KISMATIC_VERSION=1.2.1

plan:
	cd terraform && terraform plan

apply:
	cd terraform && time terraform apply

destroy:
	cd terraform && terraform destroy --force
	rm -rf ansible cfssl generated runs kismatic kubeconfig provision

get-kismatic-for-mac:
	wget -O - https://github.com/apprenda/kismatic/releases/download/v$(KISMATIC_VERSION)/kismatic-v$(KISMATIC_VERSION)-darwin-amd64.tar.gz | tar -zx

get-kismatic-for-linux:
	wget -O - https://github.com/apprenda/kismatic/releases/download/v$(KISMATIC_VERSION)/kismatic-v$(KISMATIC_VERSION)-linux-amd64.tar.gz | tar -zx

provision-cluster:
	chmod 600 ssh/cluster.pem
	time ./kismatic install apply -f kismatic-cluster.yaml
	cp generated/kubeconfig .