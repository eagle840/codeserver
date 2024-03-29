FROM python

RUN apt-get update
RUN apt-get install -y curl wget jq tree nano git unzip
RUN curl -fsSL https://code-server.dev/install.sh | sh
WORKDIR /src

# install dotnet 5
ENV DEBIAN_FRONTEND=noninteractive
RUN wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
RUN dpkg -i packages-microsoft-prod.deb
RUN  apt-get install -y apt-transport-https
RUN  apt-get update
RUN  apt-get install -y dotnet-sdk-5.0

#install python
# RUN apt-get install -y software-properties-common
# RUN add-apt-repository ppa:deadsnakes/ppa
# RUN apt-get update
# RUN apt-get install -y python3.8 python3-pip

#install azure cli 
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash

#install aws cli
RUN pip install awscli
# to fix  a dependance problem with aws:
RUN apt-get -y install groff 

# install terraform
RUN wget -q https://releases.hashicorp.com/terraform/1.2.5/terraform_1.2.5_linux_amd64.zip
RUN unzip terraform_1.2.5_linux_amd64.zip && mv ./terraform /usr/local/bin/ 
# RUN curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add -
# RUN apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
# RUN apt install -y terraform
RUN terraform -install-autocomplete

# install gcloud/sutil
RUN curl https://dl.google.com/dl/cloudsdk/release/google-cloud-sdk.tar.gz > /tmp/google-cloud-sdk.tar.gz
RUN mkdir -p /usr/local/gcloud \
  && tar -C /usr/local/gcloud -xvf /tmp/google-cloud-sdk.tar.gz \
  && /usr/local/gcloud/google-cloud-sdk/install.sh
ENV PATH $PATH:/usr/local/gcloud/google-cloud-sdk/bin

# install kuberctl
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
RUN curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
RUN echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check
RUN install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
RUN kubectl version --client

# install helm
RUN curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 \
  && chmod 700 get_helm.sh \
  && ./get_helm.sh \
  && helm version
  
LABEL maintainer="eagle840 <eagle840@gmail.com>"  version="1.1"

# ENTRYPOINT code-server --bind-addr 0.0.0.0 & ; cat /root/.config/code-server/config.yaml
# above not working right
