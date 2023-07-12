### current version - 1.0.1
FROM ubuntu:22.04

### Update apt and Install basic apps ###
RUN apt update && apt install -y apt-transport-https ca-certificates curl dnsutils gnupg git jq less nmap traceroute unzip watch wget

### Install AWS-CLI Latest ###
### https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html ###
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "/tmp/awscliv2.zip"
RUN unzip /tmp/awscliv2.zip -d /tmp
RUN /tmp/aws/install

### Install Kubectl ###
### https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/#install-using-native-package-management ###
# RUN curl -fsSL https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo --dearmor -o /etc/apt/keyrings/kubernetes-archive-keyring.gpg
RUN curl -fsSL https://packages.cloud.google.com/apt/doc/apt-key.gpg | gpg --dearmor -o /etc/apt/keyrings/kubernetes-archive-keyring.gpg && \
    echo "deb [signed-by=/etc/apt/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | tee /etc/apt/sources.list.d/kubernetes.list && \
    apt update && apt install -y kubectl

### Other things to consider
# helm
# docker 
# clustercli

ENTRYPOINT /bin/bash