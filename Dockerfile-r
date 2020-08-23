FROM rocker/verse:3.6.3-ubuntu18.04
LABEL maintainer="David Whiting <david.whiting@h2o.ai>"

# build will be quicker with NCPU higher, has no impact on performance thereafter
ARG NCPU=8

######################################
############ R INSTALL ###############
######################################

#RUN install2.r --error --ncpus=$NCPU --skipinstalled \

RUN install2.r -e -n=$NCPU -s \
        assertthat \
        aws.s3 \
        bench \
        BH \
        bit \
        bit64 \
        blob \
        callr \
        chron \
        cli \
        clipr \
        commonmark \
        covr \
        crayon \
        curl \
        DBI \
        DBItest \
        dbplyr \
        digest \
        disposables \
        dplyr \
        dtplyr \
        ellipsis \
        evaluate \
        expm \
        fansi \
        forcats \
        fs \
        generics \
        ggplot2 \
        glue \
        gsubfn \
        haven \
        Hmisc \
        hms \
        htmltools \
        htmlwidgets \
        httr \
        import \
        inline \
        knitr \
        Lahman \
        latticeExtra \
        lifecycle \
        lubridate \
        magrittr \
        MatrixModels \
        memoise \
        microbenchmark \
        mockery \
        mockr \
        nws \
        nycflights13 \
        openxlsx \
        pillar \
        pkgconfig \
        pkgdown \
        pkgKitten \
        plogr \
        prettycode \
        processx \
        proto \
        pryr \
        purrr \
        quantreg \
        R6 \
        rbenchmark \
        Rcpp \
        readr \
        RH2 \
        rlang \
        rmarkdown \
        RMySQL \
        roxygen2 \
        RPostgreSQL \
        rprintf \
        rprojroot \
        RSQLite \
        rstudioapi \
        scales \
        sfsmisc \
        snow \
        SparseM \
        spelling \
        sqldf \
        stringi \
        stringr \
        SuppDists \
        svUnit \
        testthat \
        tibble \
        tidyr \
        tidyselect \
        tinytest \
        unitizer \
        utf8 \
        vctrs \
        withr \
        xml2 \
        zeallot \
        zip \
        zoo \
    && rm -rf /tmp/* 

##########################################################
### ----- RUN INFORMATION -----
##########################################################

## Add shiny to rserver
RUN /rocker_scripts/install_shiny_server.sh 

#RUN export ADD=shiny 
#&& bash /etc/cont-init.d/add

EXPOSE 3838
EXPOSE 8787
