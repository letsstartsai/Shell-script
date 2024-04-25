#!/bin/bash

echo "Please enter username::"

read USERNAME 

echo "Please enter password::"

read -s PASSWORD #If you want to hide the password add -s after read

echo "Username is :: $USERNAME, Password is: $PASSWORD"