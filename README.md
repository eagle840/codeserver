# codeserver
Python running with codeserver



# to run

docker run -it -p:<port>:80  --name codeserver eagle840/e8codeserver  bash 
# -v:<dir>:/src   - check this
  
code-server --bind-addr 0.0.0.0

docker exec codeserver cat /root/.config/code-server/config.yaml
cat /root/.config/code-server/config.yaml

  
  
