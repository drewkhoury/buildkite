#!/usr/bin/env sh

. helloworld/bin/activate
pyinstaller -F hello_world.py
docker build -t ariv3ra/$IMAGE_NAME:$TAG .
echo $DOCKER_PWD | docker login -u $DOCKER_LOGIN --password-stdin
docker push ariv3ra/$IMAGE_NAME:$TAG
