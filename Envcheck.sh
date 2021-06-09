#ENV CHECK
#!/bin/bash 
#genrate a info.txt  with all info about the machine 
#realese 
echo ------------------------------------HOSTNAME-------------------------------------------------------------- | tee -a info.txt 
cat /proc/sys/kernel/hostname       | tee -a info.txt 
echo ------------------------------------RELEASE--------------------------------------------------------------------- | tee -a info.txt 
cat /etc/*release | tee -a info.txt 
#CPU info: 
echo -------------------------------------------------CPU----------------------------------------------------------------- | tee -a info.txt 
lscpu | tee -a info.txt 
#MEM info: 
echo ---------------------------------------MEMORY----------------------------------------------------------------- | tee -a info.txt 
free -m | tee -a info.txt 
#torage 
echo ---------------------------------------STORAGE----------------------------------------------------------------- | tee -a info.txt 
sudo df -h | tee -a info.txt 
echo ---------------------------------------PORTS----------------------------------------------------------------- | tee -a info.txt 
sudo netstat -lntu | tee -a info.txt 
echo ---------------------------------------DOCKER------------------------------------------------------------- | tee -a info.txt 
sudo docker version | tee -a info.txt 
echo ---------------------------------------DOCKER-NODE-LABEL------------------------------------------------------------ | tee -a info.txt 
sudo docker node  ls | tee -a info.txt   
echo ----------------------------------------DOCKER-STACK-------------------------------------------------- | tee -a info.txt 
sudo docker stack ls | tee -a info.txt   
echo ---------------------------------------DOCKER-SERVICE------------------------------------------------------------- | tee -a info.txt 
sudo docker service ls | tee -a info.txt   
echo ---------------------------------------DOCKER-NODE-LABEL------------------------------------------------------------- | tee -a info.txt 
sudo docker node ls -q | xargs docker node inspect \ 
  -f '{{ .ID }} [{{ .Description.Hostname }}]: {{ .Spec.Labels }}' | tee -a info.txt 
echo ---------------------------------------DOCKER-Volume------------------------------------------------------------ | tee -a info.txt 
sudo docker Volume ls | tee -a info.txt   
echo ---------------------------------------DOCKER-network------------------------------------------------------------ | tee -a info.txt 
sudo docker network ls | tee -a info.txt   
echo ----------------------------------------firewall------------------------------------------------------------ | tee -a info.txt 
sudo systemctl status firewalld | tee -a info.txt 
sudo firewall-cmd --permanent --zone=public --list-sources | tee -a info.txt

