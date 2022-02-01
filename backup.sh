#!/bin/bash
#Author : Shivam Mishra
#Date created : 02 02 2022
#Last Modified : 02/02/2022


#Description
# backup all the files in your home directory and save them all in a .tar archive




tar cvf /home/vagrant/bash_course/my_backup_"$(date +%d-%m-%Y_%H-%M-%S)".tar /home 2>/dev/null



exit 0
