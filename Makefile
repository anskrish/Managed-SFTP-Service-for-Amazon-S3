SHELL=/bin/bash

GITLAB_VERSION=12.3.5

all: gitlab gitaly

gitlab: version host_keys packer.json files/cloud.cfg.d/50_ssh.cfg
	packer build -var source_ami=$(shell terraform output gitlab-ami) -var gitlab_version=$(GITLAB_VERSION) packer.json


