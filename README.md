kafkacat
========

[![](https://images.microbadger.com/badges/image/pdouble16/kafkacat.svg)](http://microbadger.com/images/pdouble16/kafkacat "Get your own image badge on microbadger.com") [![](https://images.microbadger.com/badges/version/pdouble16/kafkacat.svg)](http://microbadger.com/images/pdouble16/kafkacat "Get your own version badge on microbadger.com") [![](https://images.microbadger.com/badges/commit/pdouble16/kafkacat.svg)](http://microbadger.com/images/pdouble16/kafkacat "Get your own version badge on microbadger.com") [![](https://images.microbadger.com/badges/license/pdouble16/kafkacat.svg)](http://microbadger.com/images/pdouble16/kafkacat "Get your own version badge on microbadger.com")

Generic command line non-JVM Apache Kafka producer and consumer.

Source for kafkacat is at https://github.com/edenhill/kafkacat

To use this image in a multi-stage build, you'll need to install ` libcrypto1.0` and `libssl1.0`.

```shell
FROM pdouble16/kafkacat:1.3.1-r1
FROM alpine:3.7
RUN apk add --no-cache libcrypto1.0 libssl1.0
COPY --from=0 /usr/local/bin/kafkacat /usr/local/bin/kafkacat
```
