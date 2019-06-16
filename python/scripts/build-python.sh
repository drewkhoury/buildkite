#!/usr/bin/env sh

#echo 'export TAG=0.1.${CIRCLE_BUILD_NUM}' >> $BASH_ENV
#echo 'export IMAGE_NAME=python-circleci-docker' >> $BASH_ENV

echo "Python env setup - installing required python modules"
virtualenv helloworld
. helloworld/bin/activate
pip install --no-cache-dir -r requirements.txt
