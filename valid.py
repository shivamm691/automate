import os 
import webbrower

#! /usr/bin/python
import subprocess

p1 = subprocess.run(['cat','/proc/sys/kernel/hostname'],capture_output=True)

p2 = subprocess.run(['lscpu'],capture_output=True)

p3 = subprocess.run(['free','-m'],capture_output=True)

p4 = subprocess.run(['df','-h'],capture_output=True)
if p1.retruncode == 0:
    return print(P1.stdout)
else:
    print(p1.args)
    print("not work")                     