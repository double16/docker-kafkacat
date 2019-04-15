FROM alpine:3.9

ARG VERSION=1.4.0

ENV LANG=en_US.UTF-8 LC_ALL=C.UTF-8 LANGUAGE=en_US.UTF-8

RUN apk add --no-cache openssl-dev curl git build-base bash tar wget python yajl yajl-dev cmake coreutils &&\
  git clone --branch ${VERSION} --single-branch https://github.com/edenhill/kafkacat.git kafkacat &&\
  cd kafkacat &&\
  ./bootstrap.sh &&\
  make install &&\
  strip /usr/local/bin/kafkacat

FROM alpine:3.9

ARG BUILD_DATE
ARG SOURCE_COMMIT
ARG DOCKERFILE_PATH
ARG SOURCE_TYPE

COPY --from=0 /usr/local/bin/kafkacat /usr/local/bin/kafkacat

ENTRYPOINT ["/usr/local/bin/kafkacat"]

LABEL maintainer="Patrick Double <pat@patdouble.com>" \
  org.label-schema.build-date=$BUILD_DATE \
  org.label-schema.docker.dockerfile="$DOCKERFILE_PATH/Dockerfile" \
  org.label-schema.license="Apache-2.0" \
  org.label-schema.name="Generic command line non-JVM Apache Kafka producer and consumer" \
  org.label-schema.url="https://bitbucket.org/double16/docker-kafkacat" \
  org.label-schema.vcs-ref=$SOURCE_COMMIT \
  org.label-schema.vcs-type="$SOURCE_TYPE" \
  org.label-schema.vcs-url="https://bitbucket.org/double16/docker-kafkacat.git"
