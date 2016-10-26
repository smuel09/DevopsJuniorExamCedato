#!/usr/bin/python

import subprocess

#Getting desired Directory
x = raw_input("Enter Path: ")
#Calling find command. find command searches files recursevly.
#command variable is for a shortcut to python syntax
command =["find","%s"%(x),"-type", "f"]
p1 = subprocess.Popen(command, stdout=subprocess.PIPE)
#counting lines with wc command from p1 stdin
p2 = subprocess.Popen(["wc", "-l"], stdin=p1.stdout, stdout=subprocess.PIPE)
p1.stdout.close()  # Allow p1 to receive a SIGPIPE if p2 exits.
output = p2.communicate()[0]
print "The number of files recursevly in this directory is: {}".format(output)


