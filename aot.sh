#!/bin/bash
jaotc --compile-for-tiered \
--output libSimpleRedisClient.so \
--verbose target/jdk13-aot-1.0-SNAPSHOT.jar