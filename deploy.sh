#!/bin/bash

echo ${TRAVIS_BRANCH//\//\_}
BRANCH=${TRAVIS_BRANCH//\//\_}

echo $BRANCH

#Apply terraform changes
#terraform init
#terraform plan

#feature/jta/travis_script
#develop/jta/whatevs
#master
#release/jta/whatevs
