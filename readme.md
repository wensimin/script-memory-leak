# memory leak example
Reproduce memory leak in kotlin scripts running in fat jar


no leak run  

`./gradlew bootrun`  

result:  
![no-leak](https://github.com/wensimin/script-memory-leak/blob/master/images/no-leak.png)

build and run fat jar

`./gradlew build`  
`java -jar .\build\libs\script-memory-leak-0.0.1-SNAPSHOT.jar`  

result:  
![leak](https://github.com/wensimin/script-memory-leak/blob/master/images/leak.png)

heap histogram:  
![leak-heap](https://github.com/wensimin/script-memory-leak/blob/master/images/leak-heap.png)

