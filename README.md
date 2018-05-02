# stack docker

To build:

```
docker build -t stack-ws .
```

To run
```
docker run -ti --mount type=bind,target=`pwd`,source=`pwd` --mount type=bind,target=/root/.stack,source=/Users/dvekeman/.stack --ulimit nofile=98304:98304 stack-ws /bin/bash
```
