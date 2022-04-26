# codeserver
Python running with codeserver

A development docker container, with  a 'codeserver' web interface.

  - python 
  - aws cli
  - gcloud and gsutil
  - azure cli
  - terraform
  - dotnet v5



# to run

docker run -it -p:<port>:80  --name codeserver eagle840/ecodeserver  bash 

`-v:<dir>:/src   - check this`
  
To start the web codeserver, run the following in the container:
`code-server --bind-addr 0.0.0.0  ` 
OR   
`docker exec ecodeserver code-server --bind-addr 0.0.0.0`

To pull the password:   
`docker exec ecodeserver cat /root/.config/code-server/config.yaml`

OR inside the container:
`cat /root/.config/code-server/config.yaml`

  
  
