#!/bin/bash

if [[ "${TRAVIS_BRANCH}" == "feature"* ]]
then
  echo "Feature branch yay"
  branch = "feature"
elif [[ "$TRAVIS_BRANCH" == "develop"* ]]
then
  echo "Non-feature boo"
  branch = "non-feat"
elif [[ "$TRAVIS_BRANCH}" == "master" ]];
then
  echo "Master branch"
  branch = "master"
fi


#Apply terraform changes
#terraform init
#terraform plan

#feature/jta/travis_script
#develop/jta/whatevs
#master
#release/jta/whatevs
