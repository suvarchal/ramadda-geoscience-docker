###
# Dockerfile for RAMADDA geo-services
###

FROM unidata/ramadda-docker:latest

###
# Usual maintenance
###

USER root

###
#Add services
###

RUN apt-get update && apt-get install -y \
    cdo \
    nco 


COPY properties ${DATA_DIR}/.properties

HEALTHCHECK --interval=30s --timeout=5s \
  CMD curl -f http://localhost:8080/repository || exit 1 
