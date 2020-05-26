FROM openjdk:8u212-alpine3.9

#OPTIONS:
# -XX:+UnlockExperimentalVMOptions : Unlock experimental features
# -XX:+UseCGroupMemoryLimitForHeap : Enable the JVM to know it is inside a container and not a normal VM for selection of heap size. Available after J8U131.
# -XX:+UseContainerSupport         : Enable automatic selection of memory heap size. Replace +UseCGroupMemoryLimitForHeap. Available by default after J8U191.
# -XX:MaxRAMFraction=1             : Configure how much memory the JVM will allocate to the Heap. 1 = 100%, 2 = 50% and 4 = 25% (default)
# -XX:MaxRAMPercentage=75.0        : Sets a percentage of how much available memory will be allocated to the Heap ( Needs to be a decimal ). 75% = 75.0
# -XX:ParallelGCThreads=2          : Number of parallel garbage collector threads. ( Set to the number of cores available to the container if > 2)
# -XX:+UseSerialGC                 : Sets up a serial garbage collector. Use this if you have 1 or less cores available to the container.

ENV JAVA_OPTS "-XX:+UseContainerSupport -XX:MaxRAMFraction=1 -XX:MaxRAMPercentage=75.0 -XX:+UseSerialGC"

CMD [ "/bin/sh", "-c", "java ${JAVA_OPTS} -XshowSettings:vm -version" ]