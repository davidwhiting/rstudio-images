#!/bin/sh

docker run --rm -d -p 8787:8787 -p 3838:3838 -e ADD=shiny -v /Users/dwhiting/tmp/r-for-progressive/contents:/home/rstudio -e ROOT=TRUE -e PASSWORD=progressive progressive/rstudio
