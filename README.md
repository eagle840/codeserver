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

## To mount: 
  
Windows Command Line (cmd), you can mount the current directory like so:
- docker run --rm -it -v %cd%:/src
In PowerShell, you use ${PWD}, which gives you the current directory:
- docker run --rm -it -v ${PWD}:/src
On Linux:
- docker run --rm -it -v $(pwd):/src
  
To start the web codeserver, run the following in the container:
`code-server --bind-addr 0.0.0.0  ` 
OR   
`docker exec ecodeserver code-server --bind-addr 0.0.0.0`

To pull the password:   
`docker exec ecodeserver cat /root/.config/code-server/config.yaml`

OR inside the container:
`cat /root/.config/code-server/config.yaml`
  
## notes
  
  ### Goole gcloud
  
  to setup authN for a project
  - open the project in GCP and got settings, and then service accounts, KEYS tabs, and create a new json authN file
  - copy to folder
  - gcloud auth activate-service-account --key-file my_service_account.json
  - for Terraform, in the google provider, add a credentials = "file.json" KV pair
 

  
  
