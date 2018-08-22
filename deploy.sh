#!/bin/bash

if [[ "${TRAVIS_BRANCH}" == "feature"* ]];
then
  echo "Feature branch yay";
else
  echo "Not feature boo";
fi

#Apply terraform changes
#terraform init
#terraform plan

#feature/jta/travis_script
#develop/jta/whatevs
#master
#release/jta/whatevs
