## Step 1: Creating a docker host
Note: you can skip this step if you already have a docker host to use or want to provision it some other way, just set DOCKER_HOST like:
```console
$ export DOCKER_HOST="tcp://192.168.99.100:2376"
```

To create a docker host, you'll need to have docker machine installed:
https://docs.docker.com/machine/install-machine/

For this example, I'll create the docker host as a local virtualbox vm, but you can alternatively create them using various cloud providers and hypervisors:
https://docs.docker.com/machine/driver

To create the docker host:
```console
$ docker-machine create -d virtualbox demo
Creating VirtualBox VM...
Creating SSH key...
Starting VirtualBox VM...
Starting VM...
To see how to connect Docker to this machine, run: docker-machine env demo
$ docker-machine ls
NAME   ACTIVE   DRIVER       STATE     URL                         SWARM
demo   *        virtualbox   Running   tcp://192.168.99.100:2376
$ docker-machine env demo
export DOCKER_TLS_VERIFY="1"
export DOCKER_HOST="tcp://192.168.99.100:2376"
export DOCKER_CERT_PATH="/home/josh/.docker/machine/machines/demo"
export DOCKER_MACHINE_NAME="demo"
# Run this command to configure your shell: 
# eval "$(docker-machine env demo)"
```

Then configure your local docker client to connect to your new machine:
```console
$ eval "$(docker-machine env demo)"
```

## Step 2: Build and run the container

```console
$ docker build -t exercise-webpage .
```

Once container is built, run it:
```console
$ docker run -dp 8000:80 exercise-webpage
2e9ef239d27a43c0a8951197060a820d9ef6650f9c7788716019df23ea0f9c44
```

## Step 4: Profit!
