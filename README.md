# JDK 8 - Instructions to use with Docker

This is a repo with instructions to create and use java containers with docker.
Mostly related to calculate heap size and manage CPU restrictions.
There is a example Dockerfile with the below configurations.

## JVM Tags

* -XX:+UnlockExperimentalVMOptions : Unlock experimental features
* -XX:+UseCGroupMemoryLimitForHeap : Enable the JVM to know it is inside a container and not a normal VM for selection of heap size. Available after J8U131.
* -XX:+UseContainerSupport         : Enable automatic selection of memory heap size. Replace +UseCGroupMemoryLimitForHeap. Available by default after J8U191.
* -XX:MaxRAMFraction=1             : Configure how much memory the JVM will allocate to the Heap. 1 = 100%, 2 = 50% and 4 = 25% (default)
* -XX:MaxRAMPercentage=75.0        : Sets a percentage of how much available memory will be allocated to the Heap ( Needs to be a decimal ). 75% = 75.0
* -XX:ParallelGCThreads=2          : Number of parallel garbage collector threads. ( Set to the number of cores available to the container if > 2)
* -XX:+UseSerialGC                 : Sets up a serial garbage collector. Use this if you have 1 or less cores available to the container.

## Usage

```
docker build -t <name> .
docker run -m 512m --cpus=1 --rm <name>
```

## Contributing
Pull requests are welcome.

## License
[MIT](https://choosealicense.com/licenses/mit/)