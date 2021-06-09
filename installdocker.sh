#!/bin/bash 
#this file install docker on a machine and change its root dir to docker_root 
echo   ------------- installing docker---------------------------------- 
sudo yum install docker-ce docker-ce-cli containerd.io 
sudo systemctl start docker  
sudo docker version  
echo --------------stopingdocker-------------------------------------------------- 
sudo service docker stop 
echo ---------------creating deamon.josn---------------------------------------------- 
sudo cat <<EOF > /etc/docker/daemon.json 
{  
   "data-root": "/root/docker_root" , 
} 
EOF 
echo -----------changing----default--dir----------------------------------------------  
sudo rsync -aP /var/lib/docker/ /root/docker_root 
sudo mv /var/lib/docker /var/lib/docker.old 
echo --------------starting-----docker-------------------------------------------------- 
sudo service docker start 
sudo systemctl start docker 
sudo rm -rf /var/lib/docker.old