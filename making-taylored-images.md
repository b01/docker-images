FROM: centos


# Making A Docker Image Taylored to an Application

There are a ton of Docker images out there on the self and may be a great fit for some applications.

However, applications are unique and there are often images do not have enough to meet its requirements, or a lot more than what is needed.

You only need to make a tailored image when you cannot find an image that meets all the requirements for your application or situation.

## Gather Application Requirements
You should first evaluate the application and think about how it interacts with its environment. 
Then document the following:

* Applications and tools used in the en by the application (ex. git for cloning repos).
* Servers it will connect to and how, such as protocals/port/IPs/etc.
* Evironment variables and scripts used.
* Services it will communicate with.
* Commands that need to be run to start the application (ex. build commands).
* If any will need to connect to it from the outside world (ex. web browser for a web application).

## Setup Docker on your System

Install Docker on your system. See the current Docker documentation on how to do that. Try http://docs.docker.com/

## Write A Dockerfile

Ultimately you'll want an image that can run your application and be deployed with the click of a button or a single command.

A "Dockerfile" is mostly responsible for constructing such an image; which provides an environment tailored to run your application. That is to say, a "Dockerfile" contains the instructions to install applications, setup the network, and whatever else the application requires to run smoothly.

It's not easy writing a Dockerfile, at first. It can be complicated writing instructions to set up the image for the application. And network configuration can make using Docker seem like a nightmare.
The upside is that once this is done, you can deploy the application just about anywhere.

Dockerfile template
```
FROM <parent-base-image>

RUN <command>

WORKDIR <directory>
```

1. Make a new directory and place a new file named **"Dockerfile"** in that directory.
```
some-dir/
  Dockerfile
```
2. Open the Dockerfile for editing.
3. Choose a parent base image, in this example we choose the CentOS as the base:
```
FROM centos:centos7
```
4. Run command to install tools the application needs to run, for example, install git so we can clone the application into the image.
```
RUN yum -y install git
```

5. Build the image by opening a terminal/PowerShell/command shell/etc and change to the directory you made. Then run 
```
docker build -t <image-name>:<tag> ./
```