#!/bin/bash

source="https://raw.githubusercontent.com/zahwanugrah/deenie"
 

# go to root
cd

wget $source/debian7/bench.sh -O - -o /dev/null|bash
