#!/bin/bash
jaotc --compile-for-tiered \
--output libOut.so \
--verbose \
--jar target/jdk13-aot-1.0-SNAPSHOT-jar-with-dependencies.jar