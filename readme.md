### try to use AOT 
#### single module project
* compilation is passed with jar plugins which includes path to dependencies.
* execution is not ready. weird class not found exception keeps showing up. the shared library is not intend to be used alone.
use this : ```java -cp target/jdk13-aot-1.0-SNAPSHOT.jar -XX:AOTLibrary=./libOut.so -XX:+PrintAOT pkg.LettuceRedisClient```
* jaotc compiles classes in the project. try to make it compile the dependencies as well. 
    * use assembly plugin to generate a fat jar. need to include class path info or jaotc fails to compile the jar.
    * but still dependencies are ignore even through they show up in the jar.
    
* using mvn exec will ignore aot compiled library loading, not knowing why.
#### multi module project