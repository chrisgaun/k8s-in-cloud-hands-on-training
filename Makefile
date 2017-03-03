KISMATIC_VERSION=1.3.0-alpha.0

generate-ssh-keys:
	mkdir ssh && cd ssh && ssh-keygen -t rsa -b 4096 -C "" -f cluster.pem -N ""

get-dependencies:
	wget --no-check-certificate -O - https://github.com/apprenda/kismatic/releases/download/v$(KISMATIC_VERSION)/kismatic-v$(KISMATIC_VERSION)-linux-amd64.tar.gz | tar -zx
	curl -LO https://storage.googleapis.com/kubernetes-release/release/$$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
	chmod +x ./kubectl
	sudo mv ./kubectl /usr/local/bin/kubectl

provision-cluster:
	chmod 600 ssh/cluster.pem
	time ./kismatic install apply -f kismatic-cluster.yaml
	cp generated/kubeconfig .