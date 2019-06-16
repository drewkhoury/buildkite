#!/usr/bin/env sh

echo "Running tests against python code (unit tests)"
. helloworld/bin/activate
python test_hello_world.py
