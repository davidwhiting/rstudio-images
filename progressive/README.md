# RStudio EC2 Image

## Introduction

This contains the information for ...

## Dockerfile

The Dockerfile builds an image that is run from the EC2 instance directly. For the end user, the fact that RStudio and Shiny are running off of a docker rather natively is immaterial and unnoticeable.

The script is pretty self-explanatory. We base the RStudio build off of the `rocker/verse` official release. 

Replace the maintainer line

```
LABEL maintainer="David Whiting <david.whiting@h2o.ai>"
```

with your own. There is one argument, `NCPU`, that will speed up R package builds if you have access to more than one cpu. The packages you want installed by default should be put in the list included under the `install2.r` line:

```
RUN install2.r -e -n=$NCPU -s \
        assertthat \
        aws.s3 \
        :
        zoo \
    && rm -rf /tmp/* 
```

## AMI Setup

This assumes you are building an AMI on an ubuntu image with username `ubuntu` (mine was built on Ubuntu 18.04 LTS). Some minor changes will be required if the username is different. As long as docker is installed, the operating system of the AMI is irrelevant.

### Step 1: Build the Docker image

With the `Makefile` and `Dockerfile` in the same directory, you should be able to run 

```
make build
```
and the docker image `progressive/rstudio` will be built. 

### Step 2: Add the contents directory

The `contents` directory is a stub that contains the configuration file `.Renviron` and an empty `R_libs` subdirectory. The `.Renviron` file contains one line:

```
R_LIBS_USER=~/R_libs/
```

which allows users to install packages in their local library. 

The role of the `contents` directory is to have a place where users can save analyses, code, and packages. The docker image will always start a container in the same stage, so any changes (like installing a package into the system library) are ephemeral and will disappear at system restart.

### Step 3: Add the run.sh file
The `run.sh` file contains the single docker run command:

```
docker run --rm -d -p 8787:8787 -p 3838:3838 -e ADD=shiny -v /home/ubuntu/contents:/home/rstudio -e ROOT=TRUE -e PASSWORD=progressive --name rstudio progressive/rstudio
```

Make sure that the file is executable, i.e., `chmod +x run.sh`. 

A few additional comments on the docker run command:

- RStudio runs on port `8787` and Shiny runs on port `3838`
- Change the `-v /home/ubuntu/contents:/home/rstudio` directive is your username is not `ubuntu`
- The username for login is `rstudio` and the password is `progressive`. 
- The `--name rstudio` directive names the container, **not** the username. This directive is not required.



## Launch AMI as EC2
I have built an AMI in the Oregon region (us-west-2) called 
 
```
whiting-progressive-rstudio (ami-0daa00d3f48a73714)
```

that you can launch an EC2 instance from to test.