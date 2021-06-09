#!/bin/sh
show_menu(){
    normal=`echo "\033[m"`
    menu=`echo "\033[36m"` #Blue
    number=`echo "\033[33m"` #yellow
    bgred=`echo "\033[41m"`
    fgred=`echo "\033[31m"`
    printf "\n${menu}*********************************************${normal}\n"
    printf "${menu}**${number} 1)${menu} ENV CHECH ${normal}\n"
    printf "${menu}**${number} 2)${menu} DOCKER INSTALL ${normal}\n"
    printf "${menu}**${number} 3)${menu} Create Swarmculter ${normal}\n"
    printf "${menu}**${number} 4)${menu}  ML INSTALLTION ${normal}\n"
    printf "${menu}**${number} 5)${menu} ENTER CLI ${normal}\n"
    printf "${menu}*********************************************${normal}\n"
    printf "Please enter a menu option and enter or ${fgred}x to exit. ${normal}"
    read opt
}


server_name=$(hostname)

function memory_check() {
    echo ""
	echo "Memory usage on ${server_name} is: "
	free -h
	echo ""
}

function cpu_check() {
    echo ""
	echo "CPU load on ${server_name} is: "
    echo ""
	uptime
    echo ""
}

function tcp_check() {
    echo ""
	echo "TCP connections on ${server_name}: "
    echo ""
	cat  /proc/net/tcp | wc -l
    echo ""
}

function kernel_check() {
    echo ""
	echo "Kernel version on ${server_name} is: "
	echo ""
	uname -r
    echo ""
}

function all_checks() {
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


	
}

menu1(){
echo -ne "
My First Menu
$(ColorGreen '1)') Memory usage
$(ColorGreen '2)') CPU load
$(ColorGreen '3)') Number of TCP connections 
$(ColorGreen '4)') Kernel version
$(ColorGreen '5)') Check All
$(ColorGreen '0)') Go to main menu
$(ColorBlue 'Choose an option:') "
        read a
        case $a in
	        1) memory_check ; menu1 ;;
	        2) cpu_check ; menu1 ;;
	        3) tcp_check ; menu1 ;;
	        4) kernel_check ; menu1 ;;
	        5) all_checks ; menu1 ;;
		    0) go to main menu; menu ;;
		*) echo -e $red"Wrong option."$clear; WrongCommand;;
        esac
}
ENV(){
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


    
}
#!/bin/bash

##
# BASH menu script that checks:
#   - Memory usage
#   - CPU load
#   - Number of TCP connections 
#   - Kernel version
##

server_name=$(hostname)

function memory_check() {
    echo ""
	echo "Memory usage on ${server_name} is: "
	free -h
	echo ""
}

function cpu_check() {
    echo ""
	echo "CPU load on ${server_name} is: "
    echo ""
	uptime
    echo ""
}

function tcp_check() {
    echo ""
	echo "TCP connections on ${server_name}: "
    echo ""
	cat  /proc/net/tcp | wc -l
    echo ""
}

function kernel_check() {
    echo ""
	echo "Kernel version on ${server_name} is: "
	echo ""
	uname -r
    echo ""
}

function all_checks() {
	memory_check
	cpu_check
	tcp_check
	kernel_check
    ENV
    
}

##
# Color  Variables
##
green='\e[32m'
blue='\e[34m'
clear='\e[0m'

##
# Color Functions
##

ColorGreen(){
	echo -ne $green$1$clear
}
ColorBlue(){
	echo -ne $blue$1$clear
}

option_picked(){
    msgcolor=`echo "\033[01;31m"` # bold red
    normal=`echo "\033[00;00m"` # normal white
    message=${@:-"${normal}Error: No message passed"}
    printf "${msgcolor}${message}${normal}\n"
}

clear
show_menu
while [ $opt != '' ]
    do
    if [ $opt = '' ]; then
      exit;
    else
      case $opt in
        1) clear;
            option_picked "Option 1 Picked";
            menu1;
            printf "YOU ARE IN MAIN MENU";
            show_menu;
        ;;
        2) clear;
            option_picked "Option 2 Picked";
            bash InstallDocker.sh
            printf "DOCKER INSTALLION IS DONE with root path  /root/docker_root";
            show_menu;
        ;;
        3) clear;
            option_picked "Option 3 Picked";
            printf " master node created";
            bash InstallDocker.sh 

            show_menu;
        ;;
        4) clear;
            option_picked "Option 4 Picked";
            printf "enter CLI";
            show_menu;
        ;;
        x)exit;
        ;;
        \n)exit;
        ;;
        *)clear;
            option_picked "Pick an option from the menu";
            show_menu;
        ;;
      esac
    fi
donexx