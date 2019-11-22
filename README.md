shapeshifter-dispatcher
=======================

Developing the dockerfile use `Dockerfile.dev`, it has a layer for each command, in a way to leverage cache as much as possible.  
Those layers **SHOULD** be squished in the production file

Build development Image:
```shell
docker build -t shapeshift-dispatcher:test -f Dockerfile.dev .
```

Build production Image:
```shell
docker build -t shapeshift-dispatcher:latest .
```
