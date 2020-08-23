default: build

## Building images
build:  
	docker build -t whiting/rstudio -f Dockerfile .

## Building special images
progressive:  
	docker build -t progressive/rstudio -f Dockerfile-progressive-r .

## start image from here
start_progressive:
	docker run --rm -d -p 8787:8787 -p 3838:3838 -e ADD=shiny -v $(pwd)/contents:/home/rstudio -e ROOT=TRUE -e PASSWORD=progressive --name rstudio progressive/rstudio
#!/bin/sh

start_progressive_ec2:
	docker run --rm -d -p 8787:8787 -p 3838:3838 -e ADD=shiny -v /home/ubuntu/contents:/home/rstudio -e ROOT=TRUE -e PASSWORD=progressive --name rstudio progressive/rstudio
