FROM ubuntu
RUN apt-get update
RUN apt-get install -y  curl wget
RUN apt-get install -y nano
RUN curl -fsSL https://code-server.dev/install.sh | sh
WORKDIR /src

# install dotnet 5
RUN wget https://packages.microsoft.com/config/ubuntu/20.10/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
RUN dpkg -i packages-microsoft-prod.deb
RUN  apt-get install -y apt-transport-https
RUN  apt-get update
RUN  apt-get install -y dotnet-sdk-5.0
RUN apt-get install -y git

#install python
RUN apt-get install -y software-properties-common
RUN add-apt-repository ppa:deadsnakes/ppa
RUN apt-get update
RUN apt-get install -y python3.8
# need to update to latest python
#  need to cp exe python3.8 to python
RUN apt-get -y install python3-pip

#install azure cli 
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash

# install terraform
RUN curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add -
RUN apt-add-repository "deb [arch=$(dpkg --print-architecture)] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
RUN apt-get install -y terraform=0.14.7



RUN pip3 install -U victoria
# the following is to get victoria working correctly
RUN pip3  install msrestazure
ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8
RUN ln -s /usr/bin/python3 /usr/bin/python

RUN curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python -
# RUN source $HOME/.poetry/env
# above returns source not found
RUN . /root/.poetry/env
