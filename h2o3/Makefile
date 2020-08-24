default: build

## Building images
build:  
	docker build -t whiting/rstudio-h2o3 -f Dockerfile .

## start image from here
start:
	docker run --rm -d -p 8787:8787 -p 3838:3838 -e ADD=shiny -v $(pwd)/contents:/home/rstudio -e ROOT=TRUE -e PASSWORD=h2o whiting/rstudio-h2o3

start_ec2:
	docker run --rm -d -p 8787:8787 -p 3838:3838 -e ADD=shiny -v /home/ubuntu/contents:/home/rstudio -e ROOT=TRUE -e PASSWORD=h2o whiting/rstudio-h2o3
