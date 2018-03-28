#########################
# multi stage Dockerfile
# 1. set up the build environment and build the expath-package
# 2. run the eXist-db
#########################
FROM openjdk:8-jdk as builder
LABEL maintainer="Peter Stadler for the TEI Council"

ENV BUILD_HOME="/opt/tei-roma-sidekick-build"
WORKDIR ${BUILD_HOME}

RUN apt-get update \
    && apt-get install -y --force-yes ant

COPY . .

RUN ant xar

#########################
# Now running the eXist-db
# and adding our freshly built xar-package
#########################
FROM stadlerpeter/existdb

ENV P5SUBSET_VERSION="current"

COPY --from=builder /opt/tei-roma-sidekick-build/build/*.xar ${EXIST_HOME}/autodeploy/