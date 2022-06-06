FROM ubuntu:20.04
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
RUN apt-get install -y software-properties-common
RUN add-apt-repository ppa:deadsnakes/ppa
RUN apt-get update
RUN apt-get install -y python3.8 python3-pip

#install azure cli 
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash

#install aws cli
RUN pip install awscli
# to fix  a dependance problem with aws:
RUN apt-get -y install groff 

# install terraform
RUN wget -q https://releases.hashicorp.com/terraform/1.1.9/terraform_1.1.9_linux_amd64.zip
RUN unzip terraform_1.1.9_linux_amd64.zip && mv ./terraform /usr/local/bin/ 

# install gcloud/sutil
RUN curl https://dl.google.com/dl/cloudsdk/release/google-cloud-sdk.tar.gz > /tmp/google-cloud-sdk.tar.gz
RUN mkdir -p /usr/local/gcloud \
  && tar -C /usr/local/gcloud -xvf /tmp/google-cloud-sdk.tar.gz \
  && /usr/local/gcloud/google-cloud-sdk/install.sh
ENV PATH $PATH:/usr/local/gcloud/google-cloud-sdk/bin

# install kubectl
apt-get update
apt-get install -y apt-transport-https ca-certificates curl
curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" |  tee /etc/apt/sources.list.d/kubernetes.list
apt-get update
apt-get install -y kubectl

# install helm
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh


# ENTRYPOINT code-server --bind-addr 0.0.0.0 & ; cat /root/.config/code-server/config.yaml
# above not working right
