#!/bin/bash 
#initalize swarm culster and genrate  worker token command in a text file  
sudo docker swarm init | tee -a workertoken.txt 
sudo docker swarm join-token manager | tee -a manager.txt 
sudp docker node ls