#!/bin/bash

docker run -ti --mount type=bind,target=/src/stack-ws,source=`pwd` --mount type=bind,target=/root/.stack,source=/Users/dvekeman/.stack_linux --ulimit nofile=98304:98304 stack-ws
