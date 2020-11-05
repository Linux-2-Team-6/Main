#!/bin/bash
#
#---------------------------------------------------------------------------------------------------------------
#  Create a function "sendfile" that takes 2 parameters/arguments: ($1) source file, ($2) target file location
#+ set those arguments to variables with some logical/easy to understand names to use in your code
#+ example call: sendfile /home/username/example.txt /home/username/backup/example.txt
#+                        ^ where the file is located
#+                                                   ^ where the file should be moved to
#
#  For now it should be enough to try this on 1 machine (from one local dir to another local dir)
#+ and not over the network, we'll add that later
#
#  Remember that you can check 'exit codes' (*hint*) to see if the last run command was a success or a fail
#---------------------------------------------------------------------------------------------------------------
#
# Psuedo code:
#
# if file (argument 1) AND target dir (argument 2) exists
#   copy file from <argument 1> to <argument 2>
#   if copy is successful
#     send back success
#   else
#     send back fail
# else
#   send back error
#
#
#  Try it out with all different kind of scenarios you can think of to see that your code covers everything that might happen
#+ Purposely fail some copies to see what happens as well as some successful copies!
#+ For example: 
#+ Call the function with a file that doesn't exist
#+ Call the function with a target dir that doesn't exist
#+ Call the function with a target dir where you don't have the correct permissions
#+ etc...
#
# Good Luck!