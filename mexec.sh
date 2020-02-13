#!/bin/bash
#java -XX:AOTLibrary=./libOut.so -XX:+PrintAOT pkg.LettuceRedisClient
#java -XX:AOTLibrary=./libOut.so  HelloWorld
#java -cp target/jdk13-aot-1.0-SNAPSHOT.jar pkg.LettuceRedisClient
#java -cp target/jdk13-aot-1.0-SNAPSHOT.jar -XX:AOTLibrary=./libOut.so -XX:+PrintAOT HelloWorld
#java -cp target/jdk13-aot-1.0-SNAPSHOT.jar -XX:AOTLibrary=./libOut.so -XX:+PrintAOT pkg.LettuceRedisClient
export MAVEN_OPTS="-XX:AOTLibrary=./libOut.so -XX:+PrintAOT"
mvn exec:java -Dexec.mainClass=pkg.LettuceRedisClient
#mvn exec:exec -Dexec.executable=java