#!/usr/bin/python

import subprocess, shlex

#Getting desired Directory
x = raw_input("Enter Path: ")
#Calling find command. find command searches files recursevly.
#command variable is for a shortcut to python syntax
command =["du", "-sh","%s"%(x)]
p1 = subprocess.check_output(command)
p1 = shlex.split(p1)
print("the size of this Directory is: {}".format(p1[0]))


