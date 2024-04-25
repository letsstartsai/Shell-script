#!/bin/bash


MOVIES=("RRR" "Raja" "Gharshana")

# size of arry is 3.
# index are 0,1,2

# list always starts with 0.
echo "First  Movie is:${MOVIES[0]}"
echo "Second Movie is:${MOVIES[1]}"
# @ means everthing 
echo "Third  Movie is:${MOVIES[@]}"