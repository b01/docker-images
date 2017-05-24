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

### Dockerfile template For an Application
```
FROM <docker-hub-repo>:<tag>

RUN <command>

WORKDIR <appname>

ENTRYPOINT ["/usr/bin/bash"]
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

### Dockerfile template for a Service 
 ```
FROM centos:centos7

RUN yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm\

 && rpm --import \
      /etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-7\
      /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7\

 && yum -y update\
 && yum -y install memcached --nogpgcheck\
 && yum clean all

EXPOSE  11211

# docker run -d --rm -p 11211:11211 --name memcached -h memcached local:memcached
# docker run -it --rm -p 11211:11211 --name memcached -h memcached local:memcached
CMD ["memcached", "-u", "daemon"]
```

### Troubleshoot

* Remove the "ENTRYPOINT" command from the Dockerfile to fix the error:
```
/usr/sbin/nginx: /usr/sbin/nginx: cannot execute binary file
```

* Start your image container in the foreground to verify it runs as expected by using the "-it" option in place of "-d"
```
docker run -it --rm <other-options> <image>
```
This command is good for test running your image, as it can sometimes show errors when there is a problem.


### Orchestrating With Docker Compose

You can use a Docker compose file to build the images and then run the containers needed for setting up an environment.

1. Make a new docker-compose.yml

Compose example:
```
version: '3'

```

You should review the [Compose file reference](https://docs.docker.com/compose/compose-file/) for a deeper 
understanding.


### References
[Docker Data Volumes](https://docs.docker.com/engine/tutorials/dockervolumes/#data-volumes)
[Composer File References](https://docs.docker.com/compose/compose-file/)
[How to Deal with Persistent Storage (eg. databases) in Docker](https://stackoverflow.com/questions/18496940/how-to-deal-with-persistent-storage-e-g-databases-in-docker#)