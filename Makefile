default: build

## Building images
build:  
	docker build -t progressive/rstudio -f Dockerfile-r .

## start image from here
start:
	docker run --rm -d -p 8787:8787 -p 3838:3838 -e ADD=shiny -v $(pwd)/contents:/home/rstudio -e ROOT=TRUE -e PASSWORD=progressive --name rstudio progressive/rstudio
