FROM ubuntu:20.04
RUN uname -a
RUN apt-get update
RUN apt-get install -y  curl wget
RUN apt-get install -y nano
RUN curl -fsSL https://code-server.dev/install.sh | sh
WORKDIR /src

# install dotnet 5
RUN wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
RUN dpkg -i packages-microsoft-prod.deb
RUN  apt-get install -y apt-transport-https
RUN  apt-get update
RUN  apt-get install -y dotnet-sdk-5.0
RUN apt-get install -y git

#install python
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get install -y software-properties-common
RUN add-apt-repository ppa:deadsnakes/ppa
RUN apt-get update

RUN apt-get install -y python3.8
# need to update to latest python
#  need to cp exe python3.8 to python
RUN apt-get -y install python3-pip

#install azure cli 
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash

#install aws cli
RUN pip install awscli
# to fix  a dependance problem with aws:
RUN apt-get -y install groff   

#install gcloud and gsutil
#next line is failing
#RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | tee -a /e>
# next two line do install, but don't add to the path
#RUN curl https://sdk.cloud.google.com > install.sh
#RUN bash install.sh --disable-prompts


# install terraform - error on gpg key
#RUN curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add -
#RUN apt-add-repository "deb [arch=$(dpkg --print-architecture)] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
#RUN apt-get install -y terraform

# install terraform
RUN apt-get -y install unzip
RUN wget -q https://releases.hashicorp.com/terraform/1.1.9/terraform_1.1.9_linux_amd64.zip
RUN unzip terraform_1.1.9_linux_amd64.zip 
RUN mv ./terraform /usr/local/bin/




# install gcloud
# Downloading gcloud package
RUN curl https://dl.google.com/dl/cloudsdk/release/google-cloud-sdk.tar.gz > /tmp/google-cloud-sdk.tar.gz

# Installing the package
RUN mkdir -p /usr/local/gcloud \
  && tar -C /usr/local/gcloud -xvf /tmp/google-cloud-sdk.tar.gz \
  && /usr/local/gcloud/google-cloud-sdk/install.sh

# Adding the package path to local
ENV PATH $PATH:/usr/local/gcloud/google-cloud-sdk/bin


# install poetrty
#RUN curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python -
# don't use the above, use:
# RUN pip3 install poetry
# RUN source $HOME/.poetry/env
# above returns source not found
# RUN . /root/.poetry/env
# above still not working right

# ENTRYPOINT code-server --bind-addr 0.0.0.0 & ; cat /root/.config/code-server/config.yaml
# above not working right