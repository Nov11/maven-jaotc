#!/bin/bash
#java -XX:AOTLibrary=./libOut.so -XX:+PrintAOT pkg.LettuceRedisClient
java -XX:AOTLibrary=./libOut.so  _HelloWorld
#java -cp target/jdk13-aot-1.0-SNAPSHOT.jar pkg.LettuceRedisClient