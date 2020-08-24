FROM rocker/verse:3.6.3-ubuntu18.04
LABEL maintainer="David Whiting <david.whiting@h2o.ai>"

## Add shiny to rserver
RUN /rocker_scripts/install_shiny_server.sh 

# build will be quicker with NCPU higher, has no impact on performance thereafter
ARG NCPU=8

######################################
############ R INSTALL ###############
######################################

#RUN install2.r --error --ncpus=$NCPU --skipinstalled \

#RUN install2.r -e -n=$NCPU -s \
#	littler \
#
##    && rm -rf /tmp/* 

##########################################################
### ----- RUN INFORMATION -----
##########################################################

#RUN export ADD=shiny && bash /etc/cont-init.d/add

EXPOSE 3838
EXPOSE 8787
