FROM ubuntu:22.04
ARG DEBIAN_FRONTEND=noninteractive

USER root

RUN apt update
RUN apt install -y tzdata git curl wget bash unzip jq gawk software-properties-common python3 python3-pip sshpass
RUN pip install 'ansible==9.2.0'
RUN pip install 'ansible-core==2.16.3'

RUN wget "https://github.com/opentofu/opentofu/releases/download/v1.9.0/tofu_1.9.0_linux_amd64.zip" -O tofu.zip && \
    unzip -j tofu.zip "tofu" -d /usr/local/bin && rm tofu.zip

RUN wget "https://releases.hashicorp.com/vault/1.18.3/vault_1.18.3_linux_amd64.zip" -O vault.zip && \
    unzip -j vault.zip "vault" -d /usr/local/bin && rm vault.zip
